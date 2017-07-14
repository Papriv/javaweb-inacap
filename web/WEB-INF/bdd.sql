//ELIMINAR BASDE DE DATO INACAP
drop database inacap;
//CREAR BASE DE DATO INACAP
create database inacap;
use inacap;
//CREAR TABLAS DE ROLES 
create table roles(
 id int(10) primary key not null auto_increment,
 type varchar(25)
);
insert into roles(type) values('administrator');
insert into roles(type) values('student');

//CREAR TABLA DE USUARIOS
create table users(
    id int(10) primary key not null auto_increment,
    name varchar(25),
    apepat varchar(25),
    apemat varchar(25),
    username varchar(25),
    password varchar(25),
    created_at datetime,
    state varchar(25),
    role_id int(10)
);
insert into users(name,apepat,apemat,username,password,created_at,state,role_id)
            values('ricardo','toledo','barria','rtoledo','secret',now(),'activo',1);

insert into users(name,apepat,apemat,username,password,created_at,state,role_id)
            values('juan','perez','rojas','jperez','secret',now(),'activo',2);


//CREAR TABLA DE CURSOS
create table courses(
    id int(10) primary key not null auto_increment,
    name varchar(25),
    description text,
    created_at datetime,
    state varchar(25)
);

insert into courses(name,description,created_at,state)
            values('matematica','asignatura de matematicas 1',now(),'activo');

insert into courses(name,description,created_at,state)
            values('castellano','asignatura de catellano 1',now(),'activo');


//TABLA USUARIOS_CURSOS
create table users_courses(
    id int(10) primary key not null auto_increment,
    user_id int(10),
    course_id int(10),
    created_at datetime
);
//JPEREZ ESTUDIA MATEMATICA Y CASTELLANO
insert into users_courses(user_id,course_id,created_at) 
            values(2,1,now());

insert into users_courses(user_id,course_id,created_at) 
            values(2,2,now());
