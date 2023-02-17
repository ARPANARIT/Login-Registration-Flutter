<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
 use Illuminate\Support\Str;

class new_register extends Model
{
    public $timestamps=false;
    protected $fillable=['name','email','password'];

    public function generateToken()
{
    $token = Str::random(10);
    return $token;
}
}
