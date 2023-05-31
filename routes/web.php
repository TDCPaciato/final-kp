<?php

use App\Http\Controllers\PengumumanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\BerandaController;
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


// Route::get('/beranda', function () {
    //     return view('beranda', [
        //         "title" => "beranda",
        //         "tanggal_berita" => "26-05-2023",
        //         "judul_berita" => "Berita ketiga pada kolom Berita", 
        //         "slug" => "judul-berita-pertama",
        //         "isi_berita" => "Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil tenetur unde suscipit explicabo aperiam dolorem est repellat, nostrum illo, deserunt non, itaque quia soluta quo. In ipsam ipsum fugiat aliquid.",
        //         "gambar" => "css/berita_konten.png",
        //         "tanggal_pengumuman" => "18-05-2023",
        //         "isi_pengumuman" => "Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil tenetur unde suscipit explicabo aperiam dolorem est repellat, nostrum illo, deserunt non"
        //     ]);
        // });
        
Route::resource('beranda', BerandaController::class);
Route::resource('pengumuman', PengumumanController::class);
Route::get('beranda_arsip', [BerandaController::class, 'berita_index']);
Route::get('pengumuman_arsip', [PengumumanController::class, 'index']);

Route::get('/profil', function () {
    return view('profil');
});

Route::get('/input_pengumuman', function () {
    return view('input_pengumuman');
});


Route::get('/masuk', function () {
    return view('auth/login');
});

Route::get('/daftar', function () {
    return view('auth/register');
})->name('daftar');


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['web', 'auth'])
    ->group(function () {
        Route::get('/logout-auto', function () {
            if (session()->has('last_activity')) {
                $inactiveTime = 60; // 5 menit dalam detik
                $lastActivity = session('last_activity');
                $currentTime = time();
                $elapsedTime = $currentTime - $lastActivity;

                if ($elapsedTime > $inactiveTime) {
                    Auth::logout();
                    session()->invalidate();
                    session()->regenerateToken();
                    return redirect('/login')->with('message', 'Anda telah logout karena tidak aktif');
                }
            }
        });
    });

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
