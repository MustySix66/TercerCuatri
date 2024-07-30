create database empleados;
use empleados;

create table contratados(
	id_empleado int primary key not null auto_increment,
    empleado varchar (50),
    puesto varchar (50)
);

-- insertar usuarios 
insert into contratados (empleado,puesto) values("Alex", "Gato");
        
select * from contratados;





-- actualizar registros 
update usuarios set clave = "1234" where empleado =1; 
 
 -- eliminar registros
 delete from contratados where id_empleado =5;

 -- consulta básica 
 
select usuario from usuarios where id_usuario=1;


