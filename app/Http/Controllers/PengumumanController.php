<?php

namespace App\Http\Controllers;

use App\Models\Pengumuman;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PengumumanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data=Pengumuman::latest()->get();
        return view('pengumuman')->with('data', $data);
    }

    

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('input_pengumuman');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'tanggal_pengumuman' => 'required|string',
            'isi_pengumuman'=> 'required|string',
            ]);
    
            Pengumuman::create($validated);
            return redirect(route('beranda.index'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Pengumuman $pengumuman)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Pengumuman $pengumuman)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Pengumuman $pengumuman)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Pengumuman $pengumuman)
    {
        //
    }
}
