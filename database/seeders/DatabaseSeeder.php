<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('admin'),
        ]);

        User::create([
            'name' => 'Eka Freti Anavilam',
            'email' => 'eka.fretinavilam@gmail.com',
            'password' => Hash::make('12345678'),
        ]);

        User::create([
            'name' => 'Kiki Kahfi Abdul Fatah',
            'email' => 'kikikahfi@gmail.com',
            'password' => Hash::make('12345678'),
        ]);
    }
}
