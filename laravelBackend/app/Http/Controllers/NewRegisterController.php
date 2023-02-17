<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\new_register;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class NewRegisterController extends Controller
{
    
   

    public function registerUser(Request $r){
        $rules=[
            'name'=>'required|string:new_registers,name',
            'email'=>'required|string|unique:new_registers,email',
            'password'=>'required|string|min:6'
        ];
        $validator=Validator::make($r->all(),$rules);
        //dd($validator);
        if($validator->fails()){
            return response()->json($validator->errors(),400);
        }
        $user=new_register::create([
            
            'name'=>$r->name,
            'email'=>$r->email,
            'password'=>Hash::make($r->password),
        ]);
        $token=$user->generateToken();
        $response=['user'=>$user,'token'=>$token];
        return response()->json($response,200);
}

public function loginUser(Request $r){
    $rules=[
        'email'=>'required',
        'password'=>'required|string'
        ];
       $r->validate($rules);
       $user=new_register::where('email',$r->email)->first();
       
        if($user && Hash::check($r->password,$user->password)){
        
            $token=$user->generateToken();
         $response=['user'=>$user,'token'=>$token];
         return response()->json($response,200);
       } 


       else{
        $response=['message'=>'Incorrect email or password'];
        return response()->json($response,400);
       }
}

public function resetPassword(Request $req){
    $rules=[
        'email'=>'required',
        'password'=>'required|string'
        ];
        $req->validate($rules);
        $user=new_register::where('email',$req->email)->first();
        if($user){
            $user->password=Hash::make($req->password);
            $user->save();
            $response=['updatedUser'=>$user];
            return response()->json($response,200);
        }
        else{
            $response=['user'=>'not found'];
            return response()->json($response,400);
        }








}

}
