<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Kegiatan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class KegiatanController extends Controller
{

    public function index()
    {
        $kegiatan = Kegiatan::all();
        return view('konten', compact('kegiatan'));
    }
    public function store(Request $request)
    {
        $validated = $request->validate([
            'judul_kegiatan' => 'required|string',
            'isi_kegiatan'=> 'required|string',
            ]);
            
            $validated['created_by'] = Auth::id();
            $validated['status'] = 0;
            Kegiatan::create($validated);
            
            return redirect(route('beranda.index'));
        }
        
        public function show($id)
        {
            $kegiatan = Kegiatan::findOrFail($id);
            return view('beranda', compact('kegiatan'));
        }
        
        public function update(Request $request, $id)
        {
            $kegiatan = Kegiatan::findOrFail($id);
            
            // Validasi inputan jika diperlukan
            $validated = $request->validate([
                'status' => 'required|integer',
            ]);
    
            // Perbarui status kegiatan
            $kegiatan->status = $validated['status'];
            $kegiatan->save();
    
            // Redirect atau lakukan tindakan lainnya sesuai kebutuhan
            return redirect(route('beranda.index'))->with('success', 'Status kegiatan berhasil diperbarui');
        }

        public function updateStatus(Request $request)
{
    $validated = $request->validate([
        'status' => 'required|in:1,2',
        'kegiatan_id' => 'required|exists:kegiatan,id',
    ]);

    $kegiatan = Kegiatan::findOrFail($validated['kegiatan_id']);
    $kegiatan->status = $validated['status'];
    $kegiatan->save();

    return response()->json(['message' => 'Status kegiatan berhasil diperbarui']);
}


}
