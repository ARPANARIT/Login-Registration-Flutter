<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\NewRegisterController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/student',[StudentController::class,'index']);
Route::get('/login',[LoginController::class,'loginAPI']);
//Route::get('/regtest',[RegisterController::class,'regtest']);
Route::get('/regtest','RegisterController@regtest');
Route::post('/register','RegisterController@register');
Route::post('/registerUser','NewRegisterController@registerUser');
Route::post('/loginUser','NewRegisterController@loginUser');
Route::post('/reset','NewRegisterController@resetPassword');