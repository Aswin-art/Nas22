<?php

namespace App\Http\Controllers;

use App\Models\Form;
use App\Models\Question;
use App\Models\User;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function create(Request $request, $slug_id)
    {
        $user = $request->user();
        // $user = User::where('email', 'user1@webtech.id')->first();
        $form = Form::where('slug', $slug_id)->first();
        if(!$form){
            return response()->json([
                'message' => 'Form not found'
            ], 404);
        }

        if($form->creator_id == $user->id){
            $data = $request->validate([
                'name' => 'required',
                'choice_type' => 'required',
                'choices' => 'required',
            ]);
            $str_choice = '';
            foreach($data['choices'] as $choice){
                $str_choice .= $choice;
            }

            $choices = str_replace(' ', ',', $str_choice);
            $data['choices'] = $choices;
            $data['form_id'] = $form->id;
            $data['is_required'] = $request->is_required;

            $question = Question::create($data);

            return response()->json([
                'message' => 'Add question success', 
                'question' => $question
            ]);
        }else{
            return response()->json([
                'message' => 'Forbidden access'
            ], 403);
        }
    }

    public function delete(Request $request, $slug_id, $question_id)
    {
        $user = $request->user();
        // $user = User::where('email', 'user1@webtech.id')->first();
        $form = Form::where('slug', $slug_id)->first();
        $question = Question::where('id', $question_id)->first();
        if(!$form){
            return response()->json([
                'message' => 'Form not found'
            ], 404);
        }

        if(!$question){
            return response()->json([
                'message' => 'Question not found'
            ], 404);
        }

        if($form->creator_id == $user->id){
            Question::destroy($question_id);
            return response()->json([
                'message' => 'Remove question success'
            ]);
        }else{
            return response()->json([
                'message' => 'Forbidden access'
            ], 403);
        }
    }
}
