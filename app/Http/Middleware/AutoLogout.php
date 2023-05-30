<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Factory as Auth;
use Illuminate\Http\Request;

class AutoLogout
{
    /**
     * The authentication factory instance.
     *
     * @var \Illuminate\Contracts\Auth\Factory
     */
    protected $auth;

    /**
     * Create a new middleware instance.
     *
     * @param  \Illuminate\Contracts\Auth\Factory  $auth
     * @return void
     */
    public function __construct(Auth $auth)
    {
        $this->auth = $auth;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if ($this->auth->guard()->check()) {
            $inactiveTime = 60; // 1 menit dalam detik
            $lastActivity = $request->session()->get('last_activity');
            $currentTime = time();
            $elapsedTime = $currentTime - $lastActivity;

            if ($elapsedTime > $inactiveTime) {
                $this->auth->guard()->logout();
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                return redirect('/login')->with('message', 'Anda telah logout karena tidak aktif');
            }

            $request->session()->put('last_activity', $currentTime);
        }

        return $next($request);
    }
}
