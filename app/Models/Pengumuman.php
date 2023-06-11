<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pengumuman extends Model
{
    use HasFactory;
    protected $table = 'pengumuman';
    protected $fillable = [
        'tanggal_pengumuman',
        'isi_pengumuman',
        'detail_pengumuman',
        'gambar',
        'created_by',
    ];
}
