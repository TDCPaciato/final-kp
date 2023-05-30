<?php

namespace App\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use App\Models\User;

class AdminPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user)
    {

    }
    
    public function view_informasi(User $user){
        return in_array($user->email, [
            'rizky@administrator.com',
            'fernandi@administrator.com'
        ]);
    }

}