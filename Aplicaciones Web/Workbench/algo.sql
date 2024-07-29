create database empresa;
use empresa;

create table usuarios (
id_usuario int primary key not null auto_increment,
usuario varchar(50),
clave varchar (128)
);

-- insertar usuarios
insert into usuarios (usuario,clave)
values("Six","123"),
		("usuario1","456");
        
select * from usuarios;

-- eliminar registros
delete from usuarios where id_usuario=4;

-- actualizar registros
update usuarios set clave="1234" where id_usuario=1;
-- consulta basica
select usuario from usuarios where id_usuario=3;