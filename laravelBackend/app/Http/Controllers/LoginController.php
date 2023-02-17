<?php

namespace App\Http\Controllers;
use App\Login;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function loginAPI(){
        return Login::all();
    }

    
}
