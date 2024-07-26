<?php
$host = 'localhost';
$db = 'petroeye_monitoring';
$user = 'root';
$pass = '';

$mysqli = new mysqli($host, $user, $pass, $db);

if ($mysqli->connect_error) {
    die('Erro de conexão: ' . $myswli->connect_error);
}
