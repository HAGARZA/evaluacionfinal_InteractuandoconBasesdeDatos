<?php

require ('conectorDB.php');

$con = new ConectorBD('localhost', 'Shaggy', '000000');
if ($con -> initConexion('agendaphp') == 'OK') {
	for ($i = 1; $i <= 3; $i++) {
		$datos['nombre'] = "Usuario " . $i;
		$datos['email'] = "user" . $i . "@mail.com";
		$datos['pass'] = password_hash("abc1234*" . $i, PASSWORD_DEFAULT);
		$datos['nacimiento'] = date('Y-m-d');
		if ($con -> insertData('AgendaUsuarios', $datos))
			echo "Se ha creado correctamente el usuario " . $i . "<br/>";
		else
			echo "Se ha producido un error en la creación del usuario" . $i . "<br/>";
	}
	$con -> cerrarConexion();
} else
	echo "Error en la conexión";

 ?>
