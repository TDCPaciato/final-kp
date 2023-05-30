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
    public function view_customer(User $user)
    {
        return in_array($user->email, [
            'rizky@administrator.com',
            'fernandi@administrator.com'
        ]);
    }
    public function create_customer(User $user)
    {
        return in_array($user->email, [
            'rizky@administrator.com',
            'fernandi@administrator.com'
        ]);
    }
    public function update_customer(User $user)
    {
        return in_array($user->email, [
            'rizky@administrator.com',
            'fernandi@administrator.com'
        ]);
    }
    public function delete_customer(User $user){
        return in_array($user->email, [
            'rizky@administrator.com',
            'fernandi@administrator.com'
        ]);
    }

}