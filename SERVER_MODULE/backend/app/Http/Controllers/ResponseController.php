<?php

namespace App\Http\Controllers;

use App\Models\AllowedDomain;
use App\Models\Form;
use App\Models\Response;
use App\Models\User;
use Illuminate\Http\Request;

class ResponseController extends Controller
{
    public function submit(Request $request, $slug)
    {
        $user = $request->user();
        // return $user;
        $form = Form::where('slug', $slug)->first();
        $domainName = explode('@', $user->email);
        $allowed_domain = AllowedDomain::where('form_id', $form->id)->where('domain', $domainName[1])->exists();

        if($allowed_domain){
            if($form->limit_one_response){
                return response()->json([
                    'message' => 'You can not submit form twice'
                ], 422);
            }else{
                $data = $request->validate([
                    'answers' => 'array'
                ]);

                $responsedata['form_id'] = $form->id;
                $responsedata['user_id'] = $user->id;

                Response::create($responsedata);

                return response()->json([
                    'message' => 'Submit response success',
                ]);
            }
        }else{
            return response()->json([
                'message' => 'Forbidden access'
            ], 403);
        }
    }

    public function index(Request $request, $slug)
    {
        $user = $request->user();
        // $user = User::where('email', 'user1@webtech.id')->first();
        $form = Form::where('slug', $slug)->first();
        if(!$form){
            return response()->json([
                'message' => 'Form not found'
            ], 404);
        }
        $responses = Response::with(['users', 'answers'])->where('form_id', $form->id)->get();
        
        if($form->creator_id == $user->id){
            return response()->json([
                'message' => 'Get responses success',
                'responses' => $responses
            ]);
        }else{
            return response()->json([
                'message' => 'Forbidden access'
            ], 403);
        }
    }
}
