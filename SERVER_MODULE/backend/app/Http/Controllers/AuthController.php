<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:5'
        ]);

        if(Auth::attempt($request->only('email', 'password'))){
            $user = Auth::user();
            $token = $user->createToken('secret')->plainTextToken;
            $user['accessToken'] = $token;

            return response()->json([
                'message' => 'Login success',
                'user' => $user
            ]);
        }else{
            return response()->json([
                'message' => 'Email or password incorrect'
            ], 401);
        }
    }

    public function logout(Request $request)
    {
        $user = $request->user();
        $user->tokens()->delete();

        return response()->json([
            'message' => 'Logout success'
        ]);
    }
}
