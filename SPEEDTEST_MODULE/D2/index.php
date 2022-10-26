<?php

$file = file_get_contents('./result.json');
$decode = json_decode($file);
// var_dump($file);
// foreach($decode[3] as $item){
//     foreach($item['messages'] as $message){
//         echo $message;
//     }
// }