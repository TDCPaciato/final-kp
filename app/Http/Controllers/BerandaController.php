<?php

namespace App\Http\Controllers;

use App\Models\Foto;
use App\Models\Konten;
use App\Http\Controllers\Controller;
use App\Models\Beranda;
use App\Models\Kegiatan;
use App\Models\Pengumuman;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use PhpParser\Node\Expr\Cast\String_;
use App\Http\Controllers\KegiatanController;


class BerandaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $kegiatanController = new KegiatanController();
        $kegiatan = $kegiatanController->index();
        $kegiatan = Kegiatan::all();
        $rencana = Kegiatan::where('created_by', '=', Auth::id())->where('status', '=', 0)->get();
        $sedang = Kegiatan::where('created_by', '=', Auth::id())->where('status', '=', 1)->get();
        $sudah = Kegiatan::where('created_by', '=', Auth::id())->where('status', '=', 2)->get();
        // $kegiatan = Kegiatan::where('status', 0)->latest()->first();
        $data=Beranda::latest()->paginate(5);
        $terbaru = Pengumuman::latest()->paginate(5);
        $rencana_kegiatan = Kegiatan::where('created_by', '=', Auth::id())->where('status', '=', 0)->count();
        $sedang_dilakukan = Kegiatan::where('created_by', '=', Auth::id())->where('status', '=', 1)->count();
        $sudah_dilakukan = Kegiatan::where('created_by', '=', Auth::id())->where('status', '=', 2)->count();
        return view('konten')->with('data', $data)->with('terbaru', $terbaru)->with('rencana_kegiatan', $rencana_kegiatan)
        ->with('sedang_dilakukan', $sedang_dilakukan)->with('sudah_dilakukan', $sudah_dilakukan)->with('kegiatan', $kegiatan)
        ->with('rencana', $rencana)->with('sedang', $sedang)->with('sudah', $sudah);
    
        // Mengurutkan data berdasarkan pertama kali diinputkan
        // $data = Beranda::orderBy('created_at', 'asc')->take(5)->get();
        // $terbaru = Pengumuman::orderBy('created_at', 'asc')->take(5)->get();
        // return view('konten')->with('data', $data)->with('terbaru', $terbaru);
    }

    public function berita_index()
    {
        $data=Beranda::latest();
        
        if(request('search')) {
            $data->where('judul_berita', 'like', '%' . request('search') . '%');
        }

        return view('beranda_arsip', [
            'data' => $data->get(),
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
        ]);

        $beranda = new Beranda();
        $beranda->judul_berita = $validated['judul_berita'];
        $beranda->tanggal_berita = $validated['tanggal_berita'];
        $beranda->isi_berita = $validated['isi_berita'];
        $beranda->created_by = Auth::id();
        $beranda->save();


        foreach($request->foto as $hehe){
        $ext = $hehe->getClientOriginalExtension();
        $nama_file = "foto-" . time() . "-" . uniqid() . "." . $ext;
        $path = $hehe ->storeAs("public/gambar", $nama_file);
                $foto = new Foto();
        $foto->gambar = $nama_file;
        $foto->konten_id=$beranda->id;
        $foto->save();
        }
        
        return redirect(route('beranda.index'));
    }

    /**
     * Display the specified resource.
     */
    public function show(String $id)
    {
        $konten = Beranda::find($id); 
        $fotos = Foto::where('konten_id', '=', $id)-> get();
        return view('konten_detail')->with('konten', $konten)-> with('fotos', $fotos);
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

        // Menghapus gambar terkait (jika ada)
        Storage::delete('public/gambar/' . $konten->gambar);

        // Menghapus entri yang terkait di tabel foto
        Foto::where('konten_id', $konten->id)->delete();

        // Menghapus berita dari database setelah menghapus entri di tabel foto
        $konten->delete();

        // Mengembalikan pengguna ke halaman beranda
        return redirect('/beranda')->with('success', 'Berita berhasil dihapus');
    }
    
}
