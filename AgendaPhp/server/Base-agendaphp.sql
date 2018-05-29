
-- Servidor: localhost
-- Tiempo de generación: 29-05-2018 
-- Versión de PHP: 7

-- creamos una base que se llame agendaphp
-- tendremos que crear un usuario llamado
-- Shaggy
-- y tendremos una contraseña 
-- 000000

use agendaphp;

CREATE TABLE AgendaEventos (
  id int(11) NOT NULL,
  titulo varchar(45) NOT NULL,
  fecha_ini date NOT NULL,
  hora_ini time DEFAULT NULL,
  fecha_fin date DEFAULT NULL,
  hora_fin time DEFAULT NULL,
  dia_completo int(11) NOT NULL,
  Usuarios_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO AgendaEventos (id, titulo, fecha_ini, hora_ini, fecha_fin, hora_fin, dia_completo, Usuarios_id) VALUES
(1, 'Cena romantica', '2018-05-19', '22:00:00', '2018-05-19', '24:00:00', 0, 1),
(2, 'Party pool', '2018-05-15', '18:00:00', '2018-05-15', '24:00:00', 0, 1),
(3, 'Trabajo', '2018-05-21', '07:00:00', '2018-05-21', '12:00:00', 1, 1);

-- select * from AgendaEventos;


INSERT INTO AgendaEventos (id, titulo, fecha_ini, hora_ini, fecha_fin, hora_fin, dia_completo, Usuarios_id) VALUES
(4, 'Reunion con familia', '2018-03-29', '09:00:00', '2018-03-29', '11:00:00', 1, 1);

CREATE TABLE AgendaUsuarios (
  id int(11) NOT NULL,
  nombre varchar(45) DEFAULT NULL,
  email varchar(45) NOT NULL,
  pasw varchar(255) NOT NULL,
  fechanac date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO AgendaUsuarios (id, nombre, email, pasw, fechanac) VALUES
(1, 'Hever', 'Garza_flow@hotmail.com', '$2y$10$OFaYsv0iTlq9FOyPYV1WtuwXg0SXjLPavjFqOR96oNQ3jtMb3rwRC', '2018-05-19'),--  contraseña 54321
(2, 'Shaggy', 'Shaggy-Scobby@hotmail.com', '$2y$10$8ALlszPqaAbDT.opNH140e6bMIW9BTXqQZoi9JYXm05w5FVaEAl/a', '2000-12-25'),-- contraseña Shaggy
(3, 'Julio', 'Hunter@hotmail.com', '$2y$10$Yanr1PAoSQCc2pIYwl79H.1oLDIknZoYsFWyLsz68Vn8Pfje2F93G', '2010-10-01');-- contraseña hunter


-- select * from AgendaUsuarios;

--
-- Indices de la tabla `AgendaEventos`
--
ALTER TABLE AgendaEventos
  ADD PRIMARY KEY (id),
  ADD KEY fk_Eventos_Usuarios_idx (Usuarios_id);

--
-- Indices de la tabla `AgendaUsuarios`
--
ALTER TABLE AgendaUsuarios
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY login_UNIQUE (email);
