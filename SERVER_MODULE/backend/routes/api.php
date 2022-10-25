<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\FormController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\ResponseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::prefix('v1')->group(function(){
    Route::prefix('auth')->group(function(){
        Route::post('login', [AuthController::class, 'login']);
        Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
    });

    Route::prefix('forms')->middleware('auth:sanctum')->group(function(){
        Route::post('', [FormController::class, 'create']);
        Route::get('', [FormController::class, 'index']);
        Route::get('/{slug_id}', [FormController::class, 'show']);
        Route::post('/{slug_id}/questions', [QuestionController::class, 'create']);
        Route::delete('/{slug_id}/questions/{question_id}', [QuestionController::class, 'delete']);

        Route::post('/{slug_id}/responses', [ResponseController::class, 'submit']);
        Route::get('/{slug}/responses', [ResponseController::class, 'index']);
    });

    // Route::prefix('forms')->group(function(){
    //     Route::post('', [FormController::class, 'create']);
    //     Route::get('', [FormController::class, 'index']);
    //     Route::get('/{slug_id}', [FormController::class, 'show']);
    //     Route::post('/{slug_id}/questions', [QuestionController::class, 'create']);
    //     Route::delete('/{slug_id}/questions/{question_id}', [QuestionController::class, 'delete']);

    //     Route::post('/{slug_id}/responses', [ResponseController::class, 'submit']);
    //     Route::get('/{slug}/responses', [ResponseController::class, 'index']);
    // });

});
