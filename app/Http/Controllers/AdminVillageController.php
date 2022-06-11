<?php

namespace App\Http\Controllers;

use App\Village;
use GrahamCampbell\ResultType\Success;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdminVillageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.villages.index', [
            'title' => 'Gampong',
            'villages' => Village::paginate(10),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.villages.create', [
            'title' => 'Tambah Gampong',
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'district' => 'required|max:255',
            'image' => 'required|image|file|max:1024',
            'office_address' => 'required|max:255',
            'site' => 'required|max:255',
            'long' => 'required',
            'lat' => 'required',
        ]);

        if ($request->file('image')) {
            $validatedData['image'] = $request->file('image')->store('village-images');
        }

        Village::create($validatedData);

        return redirect('/admin/villages/')->with('success', 'Data Gampong berhasil ditambahkan!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Village  $village
     * @return \Illuminate\Http\Response
     */
    public function show(Village $village)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Village  $village
     * @return \Illuminate\Http\Response
     */
    public function edit(Village $village)
    {
        return view('admin.villages.edit', [
            'title' => 'Perbarui Data Gampong',
            'village' => $village,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Village  $village
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Village $village)
    {
        $rules = [
            'name' => 'required',
            'district' => 'required',
            'image' => 'image|file|max:1024',
            'office_address' => 'required|max:255',
            'site' => 'required',
            'long' => 'required',
            'lat' => 'required',
        ];

        $validatedData = $request->validate($rules);

        if ($request->file('image')) {
            if ($request->oldImage) {
                Storage::delete($request->oldImage);
            }
            $validatedData['image'] = $request->file('image')->store('village-images');
        }

        Village::where('id', $village->id)->update($validatedData);

        return redirect('/admin/villages/')->with('success', 'Data Gampong berhasil diperbarui!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Village  $village
     * @return \Illuminate\Http\Response
     */
    public function destroy(Village $village)
    {
        Storage::delete($village->image);
        Village::destroy($village->id);
        return redirect('/admin/villages/')->with('success', 'Data Gampong berhasil dihapus!');
    }
}
