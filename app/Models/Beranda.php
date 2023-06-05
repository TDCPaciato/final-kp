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
        'tanggal_berita',
        'isi_berita',
        'gambar',
        'created_by',
    ];
}
