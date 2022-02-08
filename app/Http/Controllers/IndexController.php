<?php

namespace App\Http\Controllers;

use App\Post;
use App\Profile;
use App\Village;
use Illuminate\Http\Request;

class IndexController extends Controller
{
        public function index() {
        $locations = Village::all();
        $customLocations = [];
        $geoJson = [];

        foreach($locations as $location) {
            $customLocations[] = [
                'type' => 'Feature',
                'geometry' => [
                    'coordinates' => [
                        $location->long,
                        $location->lat,
                    ],
                    'type' => 'Point',
                ],
                'properties' => [
                    'locationId' => $location->id,
                    'name' => $location->name,
                    'district' => $location->district,
                    'image' => $location->image,
                    'office_address' => $location->office_address,
                    'site' => $location->site,
                ],
            ];
        }
        
        $geoLocation = [
            'type' => 'FeatureCollection',
            'features' => $customLocations,
        ];

        $geoJson = collect($geoLocation)->toJson();
        $this->geoJson = $geoJson;

        return view('index', [
            'villages' => Village::all(),
            'geoJson' => $geoJson,
            'posts' => Post::latest()->paginate(7),
            'profiles' => Profile::all(),
        ]);
    }
}
