<?php

namespace App\Http\Controllers;

use App\Models\Konten;
use App\Http\Controllers\Controller;
use App\Models\Beranda;
use App\Models\Pengumuman;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
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
    public function edit($id)
    {
        $konten = Beranda::find($id);
        return view('edit')->with('berita', $konten);
    }
    
    
    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, String $id)
    {
        // Validasi input
        $request->validate([
            'tanggal_berita' => 'required',
            'judul_berita' => 'required',
            'isi_berita' => 'required',
        ]);
    
        $konten = Beranda::find($id);

        // Update data berita
        $konten->tanggal_berita = $request->tanggal_berita;
        $konten->judul_berita = $request->judul_berita;
        $konten->isi_berita = $request->isi_berita;
    
        // Cek apakah ada file gambar yang diunggah
        if ($request->hasFile('gambar')) {
            // Validasi file gambar
            $request->validate([
                'gambar' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);
    
            // Simpan file gambar yang diunggah
            $gambarPath = $request->file('gambar')->store('public/gambar');
    
            // Ambil nama file gambar
            $gambarNama = basename($gambarPath);
    
            // Update nama gambar pada data berita
            $konten->gambar = $gambarNama;
        }
    
        // Simpan perubahan data berita
        $konten->save();
    
        // Redirect ke halaman beranda atau halaman detail berita
        return redirect('/beranda')->with('success', 'Berita berhasil diperbarui.');
    }
    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(String $id)
    {
        // Mengecek otorisasi untuk menghapus berita
        // $this->authorize('delete', $konten);
        $konten=Beranda::find($id);
    
        // dd($konten);
        // Menghapus berita dari database
        $konten->delete();
    
        // Menghapus gambar terkait (jika ada)
        Storage::delete('public/gambar/' . $konten->gambar);
    
        // Mengembalikan pengguna ke halaman beranda
        return redirect('/beranda')->with('success', 'Berita berhasil dihapus');
    }
    
}
