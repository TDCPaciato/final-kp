<?php

namespace App\Http\Controllers;

use App\Models\Konten;
use App\Http\Controllers\Controller;
use App\Models\Beranda;
use App\Models\Pengumuman;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use PhpParser\Node\Expr\Cast\String_;

class BerandaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data=Beranda::latest()->take(5)->get();
        $terbaru = Pengumuman::latest()->take(5)->get();
        return view('konten')->with('data', $data)->with('terbaru', $terbaru); 
    }

    public function berita_index()
    {
        $data=Beranda::all();
        return view('beranda_arsip', [
            'data' => $data,
        ]); 
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('input_berita');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {        
        $validated = $request->validate([
        'judul_berita' => 'required|string',
        'berita_singkat'=> 'required|string',
        'tanggal_berita'=> 'required|string',
        'isi_berita'=> 'required|string',
        'gambar' => 'required|image|mimes:jpeg,png,jpg,gif|file|max:5000',
        ]);

        $ext = $request->gambar->getClientOriginalExtension();
        $nama_file = "foto-".time().".".$ext;
        $path = $request->gambar->storeAs("public/gambar", $nama_file);

        // $gambarPath = $request->file('gambar')->store('public/gambar');
        // str_replace("public","storage",$gambarPath);
        $beranda = new Beranda();
        $beranda->judul_berita = $validated['judul_berita'];
        $beranda->berita_singkat = $validated['berita_singkat'];
        $beranda->tanggal_berita = $validated['tanggal_berita'];
        $beranda->isi_berita = $validated['isi_berita'];
        $beranda->gambar = $nama_file;
        $beranda->created_by = Auth::id();
        $beranda->save();

        return redirect(route('beranda.index'));
    }

    /**
     * Display the specified resource.
     */
    public function show(String $id)
    {
        $konten = Beranda::find($id);
        return view('konten_detail')->with('konten', $konten);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Beranda $konten)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Beranda $konten)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Beranda $konten)
    {
        //
    }
}
