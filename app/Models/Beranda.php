<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Beranda extends Model
{
    use HasFactory;
protected $table = 'kontens';
    protected $fillable = [
        'judul_berita',
        'berita_singkat',
        'tanggal_berita',
        'isi_berita',
        'gambar',
    ];
}
