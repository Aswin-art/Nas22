<?php

header('Content-Type: image/jpeg');
$wm = imagecreatefrompng('./logo.png');
$wmx = imagesx($wm);
$wmy = imagesy($wm);
$image = imagecreatefromjpeg('./image.jpg');
$imagex = imagesx($image);
$imagey = imagesy($image);

imagecopy($image, $wm, $imagex - $wmx, 0, 0, 0, $wmx, $wmy);

imagejpeg($image);