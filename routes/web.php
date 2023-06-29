<?php

use App\Http\Controllers\PengumumanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\KegiatanController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect('/beranda');
});
Route::post('/loginstore', function (Request $request) {
    $credentials = $request->validate([
        'email' => ['required', 'email'],
        'password' => ['required'],
    ]);

    if (Auth::attempt($credentials)) {
        $request->session()->regenerate();
        return redirect('/beranda');
    }

    return back()->withErrors([
        'email' => 'The provided credentials do not match our records.',
    ])->onlyInput('email');
    
})->name('login.store');
        
Route::resource('beranda', BerandaController::class);
Route::resource('pengumuman', PengumumanController::class);
Route::resource('kegiatan', KegiatanController::class);
Route::get('/kegiatan', [KegiatanController::class, 'index'])->name('kegiatan.index');
Route::get('/kegiatan/{id}', [KegiatanController::class, 'show'])->name('kegiatan.show');
Route::get('beranda_arsip', [BerandaController::class, 'berita_index']);
Route::get('pengumuman_arsip', [PengumumanController::class, 'index']);
Route::get('/input_pengumuman', [PengumumanController::class, 'create'])->name('pengumuman.create')->middleware('auth');
Route::get('/beranda/create', [BerandaController::class, 'create'])->name('beranda.create')->middleware('auth');
Route::get('/beranda/{konten}/edit', [BerandaController::class, 'edit'])->name('beranda.edit');
Route::put('/beranda/{konten}', [BerandaController::class, 'update'])->name('beranda.update');

Route::get('/profil', function () {
    return view('profil');
});

Route::get('/masuk', function () {
    return view('auth/login');
});

Route::get('/register', function () {
    return view('auth/register');
})->name('register')->middleware('auth');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
