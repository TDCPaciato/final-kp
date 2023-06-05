<?php

namespace App\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use App\Models\User;

class AdminPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user)
    {
        // Periksa apakah pengguna memiliki hak akses untuk melihat semua informasi admin
        return $user->isAdmin();
    }
    
    public function view_informasi(User $user)
    {
        // Periksa apakah pengguna memiliki hak akses untuk melihat informasi admin
        return $user->isAdmin() || in_array($user->email, [
            'admin@gmail.com',
            'eka.fretinavilam@gmail.com'
        ]);
    }
}
