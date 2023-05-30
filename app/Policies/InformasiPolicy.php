<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class InformasiPolicy
{
    use HandlesAuthorization;
    
    public function input_berita(User $user)
    {
        return in_array($user->email, [
            'rizky@administrator.com',
            'fernandi@administrator.com'
        ]);
    }
    public function input_pengumuman(User $user)
    {
        return in_array($user->email, [
            'rizky@administrator.com',
            'fernandi@administrator.com'
        ]);
    }
    public function register(User $user)
    {
        return in_array($user->email, [
            'rizky@administrator.com',
            'fernandi@administrator.com'
        ]);
    }
}