<?php

use App\Http\Controllers\IndexController;
use App\Post;
use App\Profile;
use App\Village;
use Illuminate\Support\Facades\Route;
use Illuminate\Database\Eloquent\Collection;
// Route::get('/', function () {
//     return view('index', [
//         'profiles' => Profile::all(),
//         'posts' => Post::latest()->paginate(7),
//     ]);
// })->name('index');

Route::get('/profile', function () {
    return view('profile', [
        'profiles' => Profile::all(),
    ]);
})->name('profile');

// Route::get('/village', function () {
//     return view('village', [
//         'villages' => Village::all(),
//     ]);
// })->name('village');

Route::get('/', 'IndexController@index')->name('index');

Route::get('/admin', 'AdminDashboardController@index')->name('admin');

Route::get('/blank', function () {
    return view('blank');
})->name('blank');

Route::middleware('auth')->group(function() {
    Route::resource('basic', BasicController::class);

    Route::get('/admin/user-profile', 'UserProfileController@index')->name('admin.userProfile');
    Route::put('/admin/user-profile', 'UserProfileController@update')->name('admin.userProfile.update');

    Route::resource('/admin/posts', AdminPostController::class);
    Route::get('/admin/posts/checkSlug', 'AdminPostController@checkSlug');

    Route::resource('/admin/villages', AdminVillageController::class);

    Route::resource('/admin/profile', AdminProfileController::class)->except(['destroy', 'show']);
});

Route::get('/posts', 'PostController@index')->name('posts');
Route::get('/posts/{post:slug}', 'PostController@show')->name('posts.show');

Route::get('/villages', 'VillageController@index')->name('villages');