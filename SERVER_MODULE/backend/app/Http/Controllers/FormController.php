<?php

namespace App\Http\Controllers;

use App\Models\AllowedDomain;
use App\Models\Form;
use App\Models\User;
use Illuminate\Http\Request;

class FormController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        // return $user;
        // $user = 1;
        $validate = $request->validate([
            'name' => 'required',
            'slug' => 'required|unique:forms,slug|alpha_dash',
            'allowed_domains' => 'array',
            // 'allowed_domains' => 'required'
        ]);

        // $validate['description'] = $request->description;
        // $validate['limit_one_response'] = $request->limit_one_response;
        // $validate['creator_id'] = $user->id;
        // $validate['creator_id'] = $user;

        $data['name'] = $request->name;
        $data['slug'] = $request->slug;
        $data['description'] = $request->description;
        $data['limit_one_response'] = $request->limit_one_response;
        $data['creator_id'] = $user->id;

        $form = Form::create($data);

        foreach($validate['allowed_domains'] as $domain){
            AllowedDomain::create([
                'form_id' => $form->id,
                'domain' => $domain
            ]);
        }
        
            // AllowedDomain::create([
            //     'form_id' => $form->id,
            //     'domain' => $request->allowed_domains
            // ]);



        return response()->json([
            'message' => 'Create form success',
            'form' => $data
        ]);
    }

    public function index(Request $request)
    {
        $forms = Form::all();

        return response()->json([
            'message' => 'Get all forms success',
            'forms' => $forms
        ]);
    }

    public function show(Request $request, $form_slug)
    {
        $user = $request->user();
        // $user = User::where('email', 'user1@webtech.id')->first();
        $form = Form::with('questions')->where('slug', $form_slug)->first();

        if($form){
            $user_domain = explode('@', $user->email);
            $allowed_domain = AllowedDomain::where('form_id', $form->id)->where('domain', $user_domain[1])->exists();
    
            if(!$allowed_domain){
                return response()->json([
                    'message' => 'Forbidden access'
                ], 403);
            }
            
            return response()->json([
                'message' => 'Get form success',
                'form' => $form
            ]);
        }else{
            return response()->json([
                'message' => 'Form not found'
            ], 404);
        }
    }
}
