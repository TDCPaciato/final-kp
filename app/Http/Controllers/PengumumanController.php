<?php

namespace App\Http\Controllers;

use App\Models\Pengumuman;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class PengumumanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data=Pengumuman::latest();

        if(request('search')) {
            $data->where('isi_pengumuman', 'like', '%' . request('search') . '%');
        }

        return view('pengumuman_arsip', [
            'terbaru' => $data->get(),
        ]); 
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
            'detail_pengumuman' => 'required|string',
            'gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|file|max:5000'
            ]);
            
            $validated['created_by'] = Auth::id();
            
            if ($request->hasFile('gambar')) {
                $ext = $request->gambar->getClientOriginalExtension();
                $nama_file = "foto-".time().".".$ext;
                $path = $request->gambar->storeAs("public/gambar", $nama_file);
                $validated['gambar'] = $nama_file;
            }
    
            Pengumuman::create($validated);
            return redirect(route('beranda.index'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Pengumuman $pengumuman)
    {

        return view('pengumuman_detail')->with('pengumuman', $pengumuman);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(String $id)
    {
        $pengumuman = Pengumuman::find($id);
        return view('pengumuman_edit')->with('pengumuman', $pengumuman);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, String $id)
    {
        // Validasi input
        $request->validate([
            'tanggal_pengumuman' => 'required',
            'isi_pengumuman' => 'required',
            'detail_pengumuman' => 'required',
        ]);
    
        $pengumuman = Pengumuman::find($id);

        // Update data berita
        $pengumuman->tanggal_pengumuman = $request->tanggal_pengumuman;
        $pengumuman->detail_pengumuman = $request->detail_pengumuman;
        $pengumuman->isi_pengumuman = $request->isi_pengumuman;
    
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
            $pengumuman->gambar = $gambarNama;
        }
    
        // Simpan perubahan data berita
        $pengumuman->save();
    
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
        $pengumuman=Pengumuman::find($id);
    
        // dd($konten);
        // Menghapus berita dari database
        $pengumuman->delete();
    
        // Menghapus gambar terkait (jika ada)
        Storage::delete('public/gambar/' . $pengumuman->gambar);
    
        // Mengembalikan pengguna ke halaman beranda
        return redirect('/beranda')->with('success', 'Berita berhasil dihapus');
    }
}
