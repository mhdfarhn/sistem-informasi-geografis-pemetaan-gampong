<?php

namespace App\Http\Controllers;

use App\Village;
use Illuminate\Http\Request;

class VillageController extends Controller
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

        return view('villages', [
            'villages' => Village::all(),
            'geoJson' => $geoJson,
        ]);
    }
}
