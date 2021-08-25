-- use tpgrupo14;

/*AQUI SE INGRESAN LOS DATOS DE UNA EMPRESA DE MEDIOS*/

insert into tpgrupo14.Empresa_Medios (cuit_Medios, nombre, direccion_Postal) values ('134567','America',3000),
                           ('187892','Indalo', 3002),
                           ('123983','Grupo Octubre',3000),
                           ('123874','Grupo Olmos',3002),
                           ('143225','Clarin',3004);
-- select *from tpgrupo14.Empresa_Medios

-- Cadena_Radio SE RELACIONA CON Empresa_Medios 
-- Cadena_Radio TIENE COMO FOREIGN KEY cuit_Medios

insert into tpgrupo14.Cadena_Radio (id_Cadena, nombre, nombre_Director, cuit_Medios) values (0,'Locomotora Rock','Roberto Barreto','123983'),
                         (1,'Cadena 3','Roberto Barreto','134567'),
                         (2,'Radio Antartida'   ,'Julian Romero'  , '123983'),
                         (3,'Cadena del Litoral','Ariel Vegas'    ,'123983'),
                         (4,'RockAndPop'        ,'Ivan Michelloti'   ,'123983'),
                         (5,'La Red AM'         ,'Adriana Estrada','143225'),
                         (6,'Continental'       ,'Roberto Carlos'   ,'123874'),
                         (7,'Power Max'         ,'Mariano Matinez','187892'),
                         (8,'Radio con Vos'     ,'Manuel Herreras','143225'),
                         (9,'Urbana Play'       ,'Gonzalo Reinoso','143225'),
                         (10,'Radio 10'         ,'Carlos Andreani','143225');
                            

-- SE INGRESAN LOS DATOS DE UNA EMISORA

insert into tpgrupo14.Emisora (cuit_Emisora, banda_Hertziana, direccion_Postal, nombre, nombre_Director) 
               values ('22856986849',91.5,3052 ,'jupiter'       ,'Roberto Carlos'),
					 ('25856486481',88.3,3000 ,'LT9'   ,'Hugo Sánchez'),
                     ('25565869891',100.0,3242,'LT10'          ,'Marcelo Uriarte'),
                     ('25565869852',150.9,3568,'Rock nacional' ,'Manuel Fernandez'),
                     ('25565869893',122.8,3000,'Cumbia Cumbia' ,'Fernando Barbosa'),
                     ('25565869895',145.5,3002,'Reggeton ritmo','Fabio Franco'),
                     ('25565869894',99.6,3052 ,'Radio Nacional'    ,'Joel Espindola'),
                     ('25565759896',87.45,4265,'Acua'          ,'Hérnan Zapata'),
                     ('25565999895',79.9,3565 ,'Audipax'       ,'Diego Spinoza'),
                     ('25565869090',90.3,2654 ,'Multi song'    ,'Ivan Michelloti'),
					 ('22856986999',97.7,3052 ,'Oso Rojo'      ,'Roberto Carlos'),
					 ('24197920795',85.8,2906 ,'Telefe'      ,'Hugo Sánchez'),
					 ('24549833432',72.9,2917 ,'Radio Argentina'      ,'Dolores Hermenegildo'),
					 ('24037534597',91.1,3016 ,'Back to Black'      ,'Jorge Gabino'),
					 ('24412225398',101.8,2991 ,'Cereleon'      ,'Geraldo Vito'),
					 ('24165822074',99.9,3082 ,'Interconectados'      ,'Nicolasa Azucena');
 
 /* RELACIONA Emisora Y Cadena_Radio */
 
insert into tpgrupo14.Es_Sede (id_Cadena, cuit_Emisora, es_Central) 
                    values (0,'25565869894', 0),
						  (0,'24197920795', 1),
						  (0,'24037534597', 0),
						  (0,'24549833432', 0),
						  (0,'24412225398', 0),
						  (0,'24165822074', 0),
						  (1,'25856486481', 1),
                          (2,'25565999895', 1),
                          (3,'25565759896', 1),
                          (4,'25565869090', 1),
                          (5,'25565869891', 1),
                          (6,'22856986849', 1),
                          (7,'25565869893', 1),
                          (8,'25565869852', 1),
                          (9,'25565869894', 1),
                          (10,'22856986999', 1);
                          
 /* AQUI SE INGRESAN LOS DATOS DE UN PROGRAMA DE RADIO*/  
 
insert into tpgrupo14.Programa (costo_Publicidad, nombre_Programa, descripcion) 
			  values (3000.45,'A Todo Ritmo'   ,'Pasan reggeton y cumbia.'),
                           (5000.33,'El saber'       ,'Charlas de arte pictórico.'),
                           (1000.99,'Metal en llamas','Múscica y novedades de artistas del heavy metal.'),
                           (8000.00,'Rockabilly baby','Rock bailable clasico.'),
                           (4050.65,'Estrella 80'    ,'Música de los 80.'),
                           (6050.85,'Madre Selva'    ,'Rock nacional de los 80.'),
                           (3050.65,'Adentrito'      ,'Música Folklore Nacional.'),
                           (2550.00,'El mundo hoy'   ,'Noticias nacionales regionales'),
                           (3250.22,'Contrarreloj'   ,'Noticias nacionales de Automotor'),
                           (9050.00,'Este país'      ,'Noticias nacionales e Internacionales'),
                           (5650.50,'Esta mañana'    ,'Música Para relajar la mañana'),
                           (5550.00,'Ritmo Joven'    ,'Música Electrónica que pasan en el boliche'),
				   (6985.00,'Mundo 90'       ,'Charlas de juegos y musica vintage'),
                           (4022.66,'Radio Activan'  ,'Música en general'),
				   (2653.22,'Mundo Digital'  ,'Lo último en información sobre tecnologías'),
				   (2653.22,'Noticias del Medio Dia'  ,'Entrevistas y noticias en general');
                           
/*Franja_Horaria RELACIONA Emisora Y Programa */
-- nombre_Programa, cuit_Emisora FOREIGN KEY DE Franja_Horaria
 
insert into tpgrupo14.Franja_Horaria(id_Franja, hora_Inicio, duracion_Minutos, categoria, dia_Emision, nombre_Programa, cuit_Emisora)
			values (0,'15:00:00',120,'Central','Lunes','El saber','25565759896'),
                 (1,'15:00:00' ,60 ,'Normal' ,'Martes','Mundo Digital','25565869893'),
                 (2,'22:30:00' ,180,'Baja'   ,'Miércoles','A Todo Ritmo','25565999895'),
                 (3,'10:00:00' ,90 ,'Central','Jueves','Metal en llamas','25856486481'),
                 (4,'15:30:00' ,210,'Normal' ,'Viernes','Rockabilly baby','25565869894'),
                 (5,'09:25:00' ,30 ,'Baja'   ,'Sábado','Estrella 80','25565869090'),
                 (6,'05:00:00' ,100,'Central','Martes','Madre Selva','25565869891'),
                 (7,'06:00:00' ,150,'Normal' ,'Martes','Adentrito','22856986849'),
                 (8,'08:00:00' ,122,'Baja'   ,'Miércoles','El mundo hoy','25565869893'),
                 (9,'07:00:00' ,130,'Central','Domingo','Contrarreloj','25565869852'),
                 (10,'22:00:00',170,'Normal' ,'Viernes','Este país','25565869894'),
                 (11,'23:00:00',222,'Baja'   ,'Lunes','Esta mañana','22856986999'),
                 (12,'00:00:00',133,'Central','Jueves','Ritmo Joven','25565759896'),
                 (13,'11:00:00',140,'Normal' ,'Sábado','Mundo 90','25565759896'),
                 (14,'12:00:00',145,'Baja'   ,'Miércoles','Radio Activan','22856986999'),
                 (15,'12:00:00',145,'Central'   ,'Martes','Noticias del Medio Dia','25565869894');
    
 /*nombre_Conductor RELACIONA UN PROGRAMA CON SU CONDUCTOR*/
insert into tpgrupo14.nombre_Conductor  ( nombre_Programa , nombre_Conductor )
						  values ('El saber','Valentin Zhou'),
								('El saber','Iria Perello'),
                                ('Mundo Digital','Irati Madrid'),
                                ('Mundo Digital','Laila Cobos'),
                                ('A Todo Ritmo','Jesus Llopis'),
                                ('Metal en llamas','Lorenzo Vico'),
                                ('Metal en llamas','Roger Castello'),
                                ('Metal en llamas','Karen Molina'),
                                ('Rockabilly baby','Lucio Novoa'),
                                ('Rockabilly baby','Carme Murillo'),
                                ('Estrella 80','Manel Antolin'),
                                ('Madre Selva','Pedro Calvo'),
                                ('Adentrito','Adelina Camps'),
                                ('Contrarreloj','Rita Espinosa'),
                                ('Este país','Belen Vives'),
                                ('Este país','Alex Canto'),
                                ('Esta mañana','Letícia España'),
                                ('Ritmo Joven','Andrei Olivera'),
                                ('Mundo 90','Mihaela Lara'),
                                ('Mundo 90','Olivia Mayo'),
                                ('Mundo 90','Adam Grau'),
                                ('Mundo 90','Rosana Mateo'),
                                ('Radio Activan','Gala Holgado'),
                                ('El mundo hoy','Vicente Souto'),
                                ('Noticias del Medio Dia','Gala Souto');
 
 /* AQUI INICIA LA INSERCION DE DATOS DE PUBLICIDAD */
 
insert into tpgrupo14.tanda_publicitaria ( id_Tanda, hora, fecha_Emision )
						values (0,'15:15:00','2021-07-20'), -- el saber
                              (1,'22:40:00','2021-07-21'), -- A Todo Ritmo
                              (2,'23:30:00','2021-07-21'), -- A Todo Ritmo
                              (3,'10:25:00','2021-07-21'), -- 'Metal en llamas'
                              (4,'15:35:00','2021-07-15'), -- Rockabilly baby
                              (5,'16:00:00','2021-07-15'), -- Rockabilly baby
                              (6,'16:15:00','2021-07-15'), -- Rockabilly baby
                              (7,'17:15:00','2021-07-15'), -- Rockabilly baby
                              (8,'05:10:00','2021-07-20'), -- Madre Selva
                              (9,'06:20:00','2021-07-30'), -- Adentrito
                              (10,'08:10:00','2021-07-19'), -- El mundo hoy
                              (11,'08:30:00','2021-07-19'), -- El mundo hoy
                              (12,'07:00:00','2021-07-22'), -- Contrarreloj
                              (13,'22:20:00','2021-06-20'), -- Este pais
                              (14,'23:00:00','2021-08-20'), -- Esta mañana
                              (15,'00:30:00','2021-06-25'), -- Ritmo Joven
                              (16,'11:35:00','2021-10-20'), -- 'Mundo 90'
                              (17,'12:25:00','2021-09-01'), -- Radio Activan
					(18,'15:15:00','2021-03-20'), -- el saber
                              (19,'22:40:00','2021-02-21'), -- A Todo Ritmo
                              (20,'23:30:00','2021-01-21'), -- A Todo Ritmo
                              (21,'10:25:00','2021-01-21'), -- 'Metal en llamas'
                              (22,'15:35:00','2021-02-15'), -- Rockabilly baby
                              (23,'16:00:00','2021-02-15'), -- Rockabilly baby
                              (24,'16:15:00','2021-01-15'); -- Rockabilly baby

/*RELACIONA tanda_publicitaria Y  nombre_Programa*/

-- id_Tanda Y nombre_Programa SON PRIMARY KEY DE Publica

insert into tpgrupo14.Publica (id_Tanda, nombre_Programa) values (0,'El saber'),
													(1,'A Todo Ritmo'),
                                                    (2,'A Todo Ritmo'),
                                                    (3,'Metal en llamas'),
                                                    (4,'Rockabilly baby'),
                                                    (5,'Rockabilly baby'),
                                                    (6,'Rockabilly baby'),
                                                    (7,'Rockabilly baby'),
                                                    (8,'Madre Selva'),
                                                    (9,'Adentrito'),
                                                    (10,'El mundo hoy'),
                                                    (11,'El mundo hoy'),
                                                    (12,'Contrarreloj'),
                                                    (13,'Este país'),
                                                    (14,'Esta mañana'),
                                                    (15,'Ritmo Joven'),
                                                    (16,'Mundo 90'),
                                                    (17,'Radio Activan'),
													(18,'El saber'), -- el saber
                                                    (19,'A Todo Ritmo'), -- A Todo Ritmo
                                                    (20,'A Todo Ritmo'), -- A Todo Ritmo
                                                    (21,'Metal en llamas'), -- 'Metal en llamas'
                                                    (22,'Rockabilly baby'), -- Rockabilly baby
                                                    (23,'Rockabilly baby'), -- Rockabilly baby
                                                    (24,'Rockabilly baby'); -- Rockabilly baby
 
-- SE INGRESAN LOS DATOS DE PUBLICIDAD
insert into tpgrupo14.publicidad (id_Publicidad, tipo, duracion, descripcion)
                 values (0,'Privada',120, 'Publicidad de Supermercado'),
                       (1,'Oficial',60, 'Publicidad de cerveza'),
                       (2,'Privada',30, 'Publicidad de juegos de mesa'),
                       (3,'Privada',20, 'Publicidad de Celulares '),
                       (4,'Oficial',60, 'Publicidad de Relojes '),
                       (5,'Privada',60, 'Publicidad de Gaseosa '),
                       (6,'Oficial',40, 'Publicidad de Comida para perros '),
                       (7,'Privada',50, 'Publicidad de Vinoteca '),
                       (8,'Oficial',60, 'Publicidad de Carniceria');
 
 
-- RELACIONA tanda_publicitaria Y publicidad
--  id_Publicidad Y id_Tanda SON PRIMARY KEY DE Publica_Publicidad

insert into tpgrupo14.Publica_Publicidad (id_Tanda, id_Publicidad) 
						values (0,1),(1,0),(2,4),(4,2),
                              (3,5),(5,3),(6,7),(7,6),
                              (8,8),(9,1),(10,4),(11,8),
                              (12,0),(13,0),(14,7),(15,8),
                              (16,0),(17,0),(18,3),(19,2),
							  (20,4),(21,6),(22,7),(23,2),(24,3);
-- SE INGRESAN LOS DATOS DE LOS PATROCINADORES
							
insert into tpgrupo14.Patrocinador (cuit_Patrocinador, correo_Electronico, nombre, localidad, provincia) 
                   values ('32583585690','cocacola@hotmail.com','Coca Cola','Santa Fe','Santa Fe'),
                         ('42583585691','Fran@hotmail.com','Francis Franco','Venado tuerto','Santa Fe'),
                         ('52583585692','Manu@hotmail.com','Manuel Canto','Santo Tome','Santa Fe'),
                         ('62583585693','karina@hotmail.com','Karina Novoa','Santo Tome','Santa Fe'),
                         ('72583585694','Edgar_Crespo@hotmail.com','Edgar Crespo','El Trébol','Santa Fe'),
                         ('82583585695','JoanNaranjo@hotmail.com','Joan Naranjo','Villa Ballester','Buenos Aires'),
                         ('92583585696','MatildeVargas@hotmail.com','Matilde Vargas','Vicente Lopez','Buenos Aires'),
                         ('33583585697','EusebiaReig@hotmail.com','Eusebia Reig','San José del Rincón','Santa Fe'),
                         ('34583585698','AlanDiaz@hotmail.com','Alan Diaz','Sauce Viejo','Santa Fe');

insert into tpgrupo14.Telefono_Patrocinador (cuit_Patrocinador, numero)
                            values ('32583585690' ,34254921 ),
                                 ('32583585690' ,45625893 ),
                                 ('42583585691' ,55625892 ),
                                 ('52583585692' ,45625899 ),
                                 ('62583585693' ,52625898 ),
                                 ('72583585694' ,22625897 ),
                                 ('82583585695' ,11625890 ),
                                 ('82583585695' ,99625895 ),
                                 ('92583585696' ,22625800 ),
                                 ('33583585697' ,56625025 ),
                                 ('34583585698' ,88625805 ),
                                 ('34583585698' ,26625800 );

/* RELACIONA publicidad CON Patrocinador */

-- id_Publicidad, cuit_Patrocinador SON PRYMARY KEY DE Es_Patrocinado_Por

insert into tpgrupo14.Es_Patrocinado_Por (id_Publicidad, cuit_Patrocinador) 
                       values (0,'32583585690'),
                             (1,'42583585691'),
                             (2,'52583585692'),
                             (3,'62583585693'),
                             (4,'72583585694'),
                             (5,'82583585695'),
                             (6,'92583585696'),
                             (7,'33583585697'),
                             (8,'34583585698');

/* AQUI INICIA LA INSERCION DE DATOS A EL BLOG */

-- Blog_Programa RELACIONA A programa Y A Blog_Programa

-- id_Blog, nombre_Programa SON ROREIGN KEY DE Blog_Programa

insert into tpgrupo14.Blog_Programa (id_Blog, nombre, nombre_Programa) 
              values (0,'Saber Blog','El saber'),
                    (1,'Metal Blog','Metal en llamas'),
                    (2,'Ritmo Blog','A Todo Ritmo'),
                    (3,'Rockabilly Blog','Rockabilly baby'),
                    (4,'1980 Blog','Estrella 80'),
                    (5,'Selva Blog','Madre Selva'),
                    (6,'Folklore Blog','Adentrito'),
                    (7,'Mundo hoy','El mundo hoy'),
                    (8,'NotiBlog','Contrarreloj'),
                    (9,'Este país','Este país'),
                    (10,'Mañana Blog','Esta mañana'),
                    (11,'RJoven Blog','Ritmo Joven'),
                    (12,'1990 Blog','Mundo 90'),
                    (13,'Radio Activan','Radio Activan'),
                    (14,'Digital Blog','Mundo Digital'),
                    (15,'Ultimo momento','Noticias del Medio Dia');
                    
-- Categoria SE RELACIONA CON ELLA MISMA CON es_Subcategoria COMO FOREIGN KEY                    
insert into tpgrupo14.Categoria (nombre_Categoria, descripcion, es_Subcategoria)
                   values 
				   		('Tecnología','Hardware ',null),
                        ('Música','Música en general ',null),
                        ('Noticia','Ultimos sucesos',null),
                        ('Arte','Moderno y antiguo',null),
                        ('Cine','Cultural, moderno, infantil, adulto y documental',null),
				   		('Ismos','Arte moderno','Arte'),
                        ('Heavy Metal','genero musical de los años 60','Música'),
                        ('Cumbia','Ritmo musical y baile folclórico tradicional Colombiano','Música'),
                        ('Rock','Fusión de varios estilos del folclore estadounidense','Música'),
                        ('Filmografía','Conjunto de películas cinematográficas que tienen una característica común','Cine'),
                        ('Documental','expresión de un aspecto de la realidad, mostrada en forma audiovisual','Noticia'),
                        ('Folklore','conjunto de las creencias, prácticas y costumbres que son tradicionales','Música'),
                        ('Río','Mediciones, estado y crecidas','Noticia'),
                        ('Chismentos','La vida de los famosos','Noticia'),
                        ('Urbanos','Lo que pasa en la ciudad','Noticia'),
                        ('Sorteo','Los numeros que salieron','Noticia'),
                        ('Reggaeton','estilo de música bailable urbana y latina que mezcla el reggae con el hip hop','Música'),
                        ('Juegos','Ultimos y viejos proyectos de juegos','Tecnología'),
                        ('Pop','Música popular','Música'),
                        ('Gaming','Juegos y tecnologías','Tecnología');
                        
                        

-- Nota_Blog SE RELACIONA CON Blog_Programa Y Categoria

-- id_Blog, nombre_Categoria SON FOREIGN KEY DE Nota_Blog

insert into tpgrupo14.Nota_Blog (id_Nota, resumen, fecha_Publicacion, titulo, contenido, id_Blog, nombre_Categoria) 
               values (0,'Arte de nuevos artistas pictoricos','2021-01-20','Arte Moderno','Imagenes y entrevistas',0,'Ismos'),
                     (1,'Ultimo show de Paranoid','2021-06-25','New Metal','Imagenes, videos y entrevistas',1,'Heavy Metal'),
                     (2,'Hablando con el cantante de coty','2021-01-20','Ultimo album de Coty','Imagenes y entrevistas',2,'Cumbia'),
                     (3,'HAbla de los inicios del rock y su evolución','2021-01-20','El rock inicia','Imagenes, Musica y entrevistas',3,'Rock'),
                     (4,'Resumen y critica a la pelicula','2021-01-20','Pelicula de Queens','Imagenes, video y entrevistas',4,'Filmografía'),
                     (5,'Habla de los ultimos momentos de Spinetta','2021-01-20','El deseo de vivir, Spinetta','Imagenes,videos y esntrevistas',5,'Documental'),
                     (6,'Entrevista con los musicos','2021-01-20','Festival del pescador','Imagenes,videos y entrevistas',6,'Folklore'),
                     (7,'Récord de los últimos 50 años','2021-01-20','El río Paraná bajo 45cm','Imagenes',7,'Noticia'),
                     (8,'Susana esta en estado crítico','2021-01-20','La salud de Susana','Imagenes y esntrevistas',8,'Río'),
                     (9,'Cómo funciona el operativo','2021-01-20','Área Metropolitana','Imagenes y esntrevistas',9,'Urbanos'),
                     (10,'Descubre si ganaste o no ','2021-01-20','Ganadores del sorteo','Imagenes',10,'Sorteo'),
                     (11,'Temas ineditos y algunos viejos mejorados','2021-01-20','Ultimo Album de calle 13','Imagenes, videos y entrevistas',11,'Reggaeton'),
                     (12,'Combina los trucos con tecnicas de juego','2021-01-20','Trucos del Mortal combat','Imagenes, videos',12,'Juegos'),
                     (13,'Descubre su nuevo amor','2021-01-20','Lo ultimo de Arjona','Imagenes, videos y entrevistas',0,'Pop'),
                     (14,'Analisis de las nuevas pc gaming','2021-01-20','PC gaming recomendaciones','Imagenes, videos y entrevistas',14,'Tecnología'),
                     (15, 'Noticias de ultima hora', '2021-06-24', 'Aumento a jubilados', 'Imagenes, videos y entrevistas', 15, 'Noticia') ;
   insert into tpgrupo14.cuenta_oyente (id_Oyente, contraseña, user_Name, correo_Electronico) 
                      values (0,'151515' , 'Pedrito'  ,'Pedrito@hotmail.com'),
                            (1,'202020' , 'Juancito' ,'Juancito@gmail.com'),
                            (2,'d1520'  , 'Carlitos' ,'Carlitos@frfas.com.ar'),
                            (3,'ds1502' , 'Rubencito','Stafe12@gmail.com'),
                            (4,'23546d' , 'ElPatri'  ,'ElPatri@outlook.com'),
                            (5,'ss15s20', 'ElMasKapo','ElMasKapo@hotmail.com.ar'),
                            (6,'222sss' , 'Toxico99' ,'Toxico99@gmail.com');
            
  /*comentario RELACIONA A cuenta_oyente Y Nota_Blog */
  -- id_Nota, id_Oyente, correo_Oyente SON FOREIGN KEY DE comentario
  
insert into tpgrupo14.comentario (id_Comentario, texto, puntuacion, fecha_Realizacion, id_Nota, id_Oyente, correo_Oyente)
                 values (0,'Que buen arte pictorico',5,'2021-01-20',0,0,'Pedrito@hotmail.com'),
                       (1,'Yo soy mas del renacimiento',5,'2021-01-20',0,1,'Juancito@gmail.com'),
                       (2,'Que buena banda espero verlos de nuevo',5,'2020-02-14',1,2,'Carlitos@frfas.com.ar'),
                       (3,'El segndo tema fue el mejor',5,'2020-02-14',1,3,'Stafe12@gmail.com'),
                       (4,'Es un genio cantando',5,'2021-01-20',2,4,'ElPatri@outlook.com'),
                       (5,'Ya me compre el cd',5,'2021-01-20',2,5,'ElMasKapo@hotmail.com.ar'),
                       (6,'Tremenda la historia del rock',5,'2021-01-20',3,6,'Toxico99@gmail.com'),
                       (7, 'Es poco el aumento', 4, '2021-01-20', 15, 6,'Toxico99@gmail.com'),
                       (8, 'Pobres jubilados', 6, '2021-01-20', 15, 3,'Stafe12@gmail.com');
					   