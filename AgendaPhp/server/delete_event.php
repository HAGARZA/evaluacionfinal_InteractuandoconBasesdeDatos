<?php
session_start();
require ('conectorDB.php');

if ($_SESSION['isLogin']) {

	$con = new ConectorBD('localhost', 'Shaggy', '000000');
	$response['conexion'] = $con -> initConexion('agendaphp');
	
	if ($response['conexion'] == 'OK') {
		
		if ($con -> eliminarRegistro('AgendaEventos', 'id = ' . $_POST['id']))
			$response['msg'] = 'OK';
		else
			$response['msg'] = 'Error al guardar el evento';
	} else
		$response['msg'] = 'Eror en la conexión a la base de datos';
} else
	$response['msg'] = 'Por Favor inicié sesión para continuar';

echo json_encode($response);


 ?>