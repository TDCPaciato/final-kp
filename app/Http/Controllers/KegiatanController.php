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
        $kegiatans = Kegiatan::all();
        $rencana_kegiatan = count($kegiatans);
        return view('beranda.index', compact('rencana_kegiatan'));
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
            return view('beranda.show', compact('kegiatan'));
        }
}
