<?php

namespace App\Http\Controllers;

use App\Post;
use App\User;
use App\Village;
use Illuminate\Http\Request;

class AdminDashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $users = User::count();
        $posts = Post::count();
        $villages = Village::count();

        $widget = [
            'users' => $users,
            'posts' => $posts,
            'villages' => $villages,
        ];

        return view('admin.index', compact('widget'));
    }
}
