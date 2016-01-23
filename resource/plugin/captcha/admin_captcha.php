<?php
session_start();
require('captcha.php');
$img = new captcha('image/', 62, 20);
$img->session_word = 'captcha_login';
$img->generate_image();
?>