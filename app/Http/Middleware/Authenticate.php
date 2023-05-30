<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request): ?string
    {
        // Mendapatkan waktu kedaluwarsa sesi pengguna yang sedang login
$sessionTimeout = config('session.lifetime') * 60;

// Memeriksa apakah pengguna telah login
if (Auth::check()) {
    // Mendapatkan waktu terakhir akses pengguna
    $lastActivity = session('last_activity');

    // Memeriksa apakah sesi pengguna sudah kadaluwarsa
    if (time() - $lastActivity > $sessionTimeout) {
        // Jika sesi sudah kadaluwarsa, logout pengguna dan hapus sesi
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/login')->with('status', 'Sesi Anda telah kadaluwarsa. Silakan login kembali.');
    }

    // Memperbarui waktu terakhir akses pengguna
    session(['last_activity' => time()]);
}


        return $request->expectsJson() ? null : route('login');
    }
}
