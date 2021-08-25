create schema tpgrupo14;


create table tpgrupo14.Empresa_Medios(

cuit_Medios varchar(14) primary key,
nombre varchar(15),
direccion_Postal varchar(8)

);

create table tpgrupo14.Cadena_Radio(

id_cadena int primary key,
nombre varchar(30),
nombre_director varchar(15),
cuit_Medios varchar(14) references tpgrupo14.Empresa_Medios(cuit_Medios) 

);

create table tpgrupo14.Emisora(

cuit_Emisora varchar(14) primary key,
banda_Hertziana float,
direccion_Postal int,
nombre varchar(15),
nombre_director varchar(20)

);

create table tpgrupo14.es_sede(
id_cadena int references tpgrupo14.Cadena_Radio(id_cadena),
cuit_Emisora varchar(14) references tpgrupo14.Emisora(cuit_Emisora),
es_Central int CHECK (es_Central in (0,1)),
primary key(id_cadena,cuit_Emisora)
);
create table tpgrupo14.Programa(
costo_publicidad float,
nombre_programa varchar(25) primary key,
descripcion varchar (50)
);
create table tpgrupo14.franja_horaria(

id_Franja int primary key,
hora_Inicio time,
duracion_Minutos int,
categoria varchar(20),
dia_Emision varchar(10),
nombre_programa varchar(25),
cuit_Emisora varchar(14),
constraint fk_nombre_programa foreign key (nombre_programa) references tpgrupo14.programa (nombre_programa),
constraint fk_cuit_Emisora foreign key (cuit_Emisora) references tpgrupo14.Emisora (cuit_Emisora)

);



create table tpgrupo14.nombre_Conductor(

nombre_programa varchar(25) references tpgrupo14.Programa(nombre_programa),
nombre_Conductor varchar(20),
primary key (nombre_programa,nombre_Conductor) 

);

create table tpgrupo14.Tanda_Publicitaria(

id_Tanda int primary key,
hora time,
fecha_emision date

);


create table tpgrupo14.Publica (

id_Tanda int  references tpgrupo14.Tanda_Publicitaria (id_Tanda),
nombre_programa varchar(25) references tpgrupo14.Programa(nombre_programa),
primary key(id_Tanda,nombre_programa)

);



create table tpgrupo14.Publicidad (

id_Publicidad int primary key,
tipo varchar(15),
duracion int,
descripcion varchar(50)

);


create table tpgrupo14.Publica_Publicidad (

id_Publicidad int references tpgrupo14.Publicidad(id_Publicidad),
id_Tanda int references tpgrupo14.Tanda_Publicitaria(id_Tanda),
primary key(id_Publicidad,id_Tanda)

);

create table tpgrupo14.Patrocinador(

cuit_Patrocinador varchar(14) primary key,
correo_Electronico varchar(30),
nombre varchar(20),
localidad varchar(30),
provincia varchar(15)

);

create table tpgrupo14.Telefono_Patrocinador (

cuit_Patrocinador varchar(14) references tpgrupo14.Patrocinador(cuit_Patrocinador),
numero int,
primary key (cuit_Patrocinador,numero)
);

create table tpgrupo14.Es_Patrocinado_Por(

id_Publicidad int references tpgrupo14.Publicidad(id_Publicidad),
cuit_Patrocinador varchar(14)  references tpgrupo14.Patrocinador(cuit_Patrocinador),
primary key (id_Publicidad, cuit_Patrocinador)
);


create table tpgrupo14.blog_programa(

id_blog int primary key,
nombre varchar(20),
nombre_programa varchar(25) references tpgrupo14.Programa(nombre_programa)

);

create table tpgrupo14.Categoria (

nombre_Categoria varchar(15) primary key,
descripcion varchar(80),
es_Subcategoria  varchar(15) references tpgrupo14.Categoria(nombre_Categoria)

);


create table tpgrupo14.nota_blog (

id_nota int primary key,
resumen varchar(50),
fecha_publicacion date,
titulo varchar (30),
contenido varchar (30),
id_blog int references tpgrupo14.blog_programa(id_blog),
nombre_Categoria varchar(15) references tpgrupo14.Categoria(nombre_Categoria)

);

create table tpgrupo14.Cuenta_Oyente(

id_Oyente int  unique,
contraseña varchar(40),
user_Name varchar(40),
correo_Electronico varchar(40) unique,
fecha_registro date default CURRENT_DATE,
primary key(id_Oyente, correo_Electronico)
);

create table tpgrupo14.Comentario(

id_Comentario int primary key,
texto text,
puntuacion int,
fecha_Realizacion date,
id_nota int references tpgrupo14.nota_blog (id_nota),
id_Oyente int references tpgrupo14.Cuenta_Oyente(id_Oyente),
correo_Oyente varchar(40) references tpgrupo14.Cuenta_Oyente(correo_Electronico)

);