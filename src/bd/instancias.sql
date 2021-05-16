INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(0, 'Antonio', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Francisco', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Manuel', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Penya', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(0, 'Jose', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(0, 'Pepe', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Maria', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Felipe', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Sergio', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(0, 'Alejandra', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(0, 'Carmen', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Laura', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Marina', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Jorge', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(0, 'Ana', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(0, 'Alberto', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Zacarías', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Gustavo', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(1, 'Lucia', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(0, 'Paula', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(2, 'Enrique', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(2, 'Raquel', '1234');
INSERT INTO USUARIO (ROL, NICKNAME, PASSWORD) VALUES(3, 'Horrible', '1234');


INSERT INTO USUARIO_EVENTO (USUARIO, APELLIDO, DOMICILIO, CIUDAD, EDAD, SEXO) VALUES (3, 'Nieto', 'ejemplo', 'Malaga', 20, 'Hombre');
INSERT INTO USUARIO_EVENTO (USUARIO, APELLIDO, DOMICILIO, CIUDAD, EDAD, SEXO) VALUES (5, 'Archilla', 'sitio', 'Almeria', 35, 'Hombre');
INSERT INTO USUARIO_EVENTO (USUARIO, APELLIDO, DOMICILIO, CIUDAD, EDAD, SEXO) VALUES (3, 'Canterio', 'ejemplo', 'Malaga', 20, 'Mujer');
INSERT INTO USUARIO_EVENTO (USUARIO, APELLIDO, DOMICILIO, CIUDAD, EDAD, SEXO) VALUES (5, 'Vera', 'sitio', 'Almeria', 35, 'Mujer');
INSERT INTO USUARIO_EVENTO (USUARIO, APELLIDO, DOMICILIO, CIUDAD, EDAD, SEXO) VALUES (3, 'Romero', 'ejemplo', 'Malaga', 20, 'Mujer');
INSERT INTO USUARIO_EVENTO (USUARIO, APELLIDO, DOMICILIO, CIUDAD, EDAD, SEXO) VALUES (5, 'Gómez', 'sitio', 'Almeria', 35, 'Hombre');


INSERT INTO EVENTO (TITULO, DESCRIPCION, FECHA, FECHA_RESERVA, COSTE_ENTRADA, AFORO, MAX_NUM_ENTRADAS, MUSICA, AIRE_LIBRE, DEPORTE, TEATRO, GAMING) 
VALUES ('Hackers week', 'Cosa de informatica', '04/4/2021', '04/7/2022', 3, 43, 23, 0, 1, 0, 0, 1);
INSERT INTO EVENTO (TITULO, DESCRIPCION, FECHA, FECHA_RESERVA, COSTE_ENTRADA, AFORO, MAX_NUM_ENTRADAS, MUSICA, AIRE_LIBRE, DEPORTE, TEATRO, GAMING) 
VALUES ('Semana Santa', 'Cosa de cristianos', '02/4/2031', '04/7/2022', 45, 104, 17, 0, 1, 0, 0, 0);
INSERT INTO EVENTO (TITULO, DESCRIPCION, FECHA, FECHA_RESERVA, COSTE_ENTRADA, AFORO, MAX_NUM_ENTRADAS, MUSICA, AIRE_LIBRE, DEPORTE, TEATRO, GAMING) 
VALUES ('Concierto al aire libre', 'Cosa de música', '2/22/2030', '4/28/2032', 4, 14, 7, 1, 1, 0, 0, 0);
INSERT INTO EVENTO (TITULO, DESCRIPCION, FECHA, FECHA_RESERVA, COSTE_ENTRADA, AFORO, MAX_NUM_ENTRADAS, MUSICA, AIRE_LIBRE, DEPORTE, TEATRO, GAMING) 
VALUES ('Concierto de Rock', 'Cosa de musica', '02/4/2031', '04/7/2022', 15, 124, 32, 1, 0, 0, 1, 0);
INSERT INTO EVENTO (TITULO, DESCRIPCION, FECHA, FECHA_RESERVA, COSTE_ENTRADA, AFORO, MAX_NUM_ENTRADAS, MUSICA, AIRE_LIBRE, DEPORTE, TEATRO, GAMING) 
VALUES ('Salón del manga', 'Cosa de libros', '02/24/2021', '04/17/2022', 42, 214, 117, 0, 0, 0, 1, 0);

INSERT INTO CHAT (USUARIO1, USUARIO2) VALUES (21,1);
INSERT INTO CHAT (USUARIO1, USUARIO2) VALUES (21,5);
INSERT INTO CHAT (USUARIO1, USUARIO2) VALUES (21,6);
INSERT INTO CHAT (USUARIO1, USUARIO2) VALUES (22,10);
INSERT INTO CHAT (USUARIO1, USUARIO2) VALUES (22,15);
INSERT INTO CHAT (USUARIO1, USUARIO2) VALUES (22,20);

INSERT INTO MENSAJE (CHAT,TEXTO,FECHA_HORA, EMISOR) VALUES (1,'Hola, tengo una duda','2021-04-24 12:00:00',1);
INSERT INTO MENSAJE (CHAT,TEXTO,FECHA_HORA, EMISOR) VALUES (1,'Hola qué tal estás','2021-04-24 12:30:00',21);