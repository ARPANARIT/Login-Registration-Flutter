<?php

namespace App\Http\Controllers;
use App\Register;
use Illuminate\Http\Request;



class RegisterController extends Controller
{
    public function register(Request $request){
        $reg=new Register();
        $reg->Rname=$request->post('Aname');
        $reg->Remail=$request->post('Aemail');
        $reg->Rpass=$request->post('Apass');
        if($reg->save()){return response()->json([
            'success'=>true,
        ]);}
        else{return response()->json([
            'success'=>false,
        ]);}
        
    }

    public function regtest(){
        return Register::all();
    }
    public function rform(){
        return view('form');
    }
    public function tform(){
        return view('welcome');
    }

    
}
