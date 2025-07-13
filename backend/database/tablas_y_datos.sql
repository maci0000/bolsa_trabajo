CREATE DATABASE IF NOT EXISTS trabajo_sgbd1_2;
USE trabajo_sgbd1_2; # pon aquí el nombre de tu base de datos

-- Tabla UNIVERSIDAD
CREATE TABLE UNIVERSIDAD (
    ID_Universidad INT(11) NOT NULL PRIMARY KEY,
    Nombre_Universidad VARCHAR(100) NOT NULL,
    Dirección_Universidad VARCHAR(150) NOT NULL,
    Teléfono_Universidad VARCHAR(11) NOT NULL,
    Email_Universidad VARCHAR(100) NOT NULL
);

-- Tabla POSTULANTE
CREATE TABLE POSTULANTE (
    ID_Postulante INT(11) NOT NULL PRIMARY KEY,
    Carrera VARCHAR(20) NOT NULL,
    Año_Ingreso YEAR NOT NULL,
    Nombre VARCHAR(40) NOT NULL,
    Apellido VARCHAR(40) NOT NULL,
    Email_Estudiante VARCHAR(100) NOT NULL,
    Teléfono_Estudiante VARCHAR(40) NOT NULL,
    ID_Universidad INT(11) NOT NULL,
    FOREIGN KEY (ID_Universidad) REFERENCES UNIVERSIDAD(ID_Universidad)
);

-- Tabla CURSO
CREATE TABLE CURSO (
    ID_Curso INT(11) NOT NULL PRIMARY KEY,
    Nombre_Curso VARCHAR(40) NOT NULL,
    Descripción_Curso VARCHAR(100) NOT NULL,
    Duración_Curso INT(11) NOT NULL
);

-- Tabla ESTUD_CURSO (relación muchos a muchos entre estudiante y curso)
CREATE TABLE ESTUD_CURSO (
    ID_Postulante INT(11) NOT NULL,
    ID_Curso INT(11) NOT NULL,
    Fecha_Curso DATE NOT NULL,
    Estado_Curso VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID_Postulante, ID_Curso),
    FOREIGN KEY (ID_Postulante) REFERENCES POSTULANTE(ID_Postulante),
    FOREIGN KEY (ID_Curso) REFERENCES CURSO(ID_Curso)
);

-- Tabla PUESTO_TRABAJO
CREATE TABLE PUESTO_TRABAJO (
    ID_Puesto INT(11) NOT NULL PRIMARY KEY,
    Titulo_Puesto VARCHAR(50) NOT NULL,
    Descripción_Puesto VARCHAR(100) NOT NULL,
    Fecha_Publicación DATE NOT NULL,
    Vacantes INT(11) NOT NULL
);

-- Tabla VACANTE
CREATE TABLE VACANTE (
    ID_Vacante INT(11) NOT NULL PRIMARY KEY,
    Fecha_Postulación DATE NOT NULL,
    Estado_Postulación VARCHAR(40) NOT NULL,
    ID_Postulante INT(11) NOT NULL,
    ID_Puesto INT(11) NOT NULL,
    FOREIGN KEY (ID_Postulante) REFERENCES POSTULANTE(ID_Postulante),
    FOREIGN KEY (ID_Puesto) REFERENCES PUESTO_TRABAJO(ID_Puesto)
);

CREATE TABLE Empresa (
    ID_Empresa INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Empresa VARCHAR(100) NOT NULL UNIQUE,
    Email_Contacto VARCHAR(100) NOT NULL UNIQUE,
    Telefono_Contacto VARCHAR(40),
    RUC VARCHAR(40),
    Razon_social VARCHAR(40),
    Direccion_Fiscal VARCHAR(40),
    Direccion_Empresa VARCHAR(255),
    -- Campos para autenticación
    Contrasena_Hash VARCHAR(255) NOT NULL, -- Para almacenar el hash de la contraseña
    Fecha_Registro DATE NOT NULL
);

-- inserción de datos

INSERT INTO curso VALUES ('100', 'Cálculo Diferencial', 'Cálculo de funciones, límites y derivadas', '5' );
INSERT INTO curso VALUES ('101', 'Contabilidad Financiera', 'Análisis de la información financiera', '5' );
INSERT INTO curso VALUES ('102', 'Marketing Digital', 'Promoción en entornos digitales', '6' );
INSERT INTO curso VALUES ('103', 'Diseño gráfico', 'Creación de arte visual digital', '5' );
INSERT INTO curso VALUES ('104', 'Fundamentos de programación', 'Escritura de código en lenguajes de programación', '5' );
INSERT INTO curso VALUES ('105', 'Economía General', 'Conceptos básicos de economía', '5' );
INSERT INTO curso VALUES ('106', 'Teoría del Derecho', 'Conceptos fundamentales sobre derecho', '6' );
INSERT INTO curso VALUES ('107', 'Microbiología General', 'Estudio de los microorganismos', '6' );
INSERT INTO curso VALUES ('108', 'Geotecnia', 'Comportamiento del suelo', '5' );
INSERT INTO curso VALUES ('109', 'Fisiología Vegetal', 'Estudio de las funciones vitales de las plantas', '5' );
INSERT INTO curso VALUES ('110', 'Química Orgánica', 'Estudio de compuestos con carbono y sus reacciones', '4' );
INSERT INTO curso VALUES ('111', 'Estadística Aplicada', 'Métodos estadísticos para tomar decisiones basadas en datos', '6' );
INSERT INTO curso VALUES ('112', 'Periodismo de Investigación', 'Creación de reportajes periodísticos', '6' );
INSERT INTO curso VALUES ('113', 'Teoría de la Comunicación', 'Modelos y procesos comunicativos', '4' );
INSERT INTO curso VALUES ('114', 'Legislación laboral', 'Normas legales que regulan las relaciones laborales', '6' );

insert into universidad values ('301', 'Universidad Nacional Agraria La Molina', 'Av. La Molina s/n, La Molina, Lima', '6147800', 'estudios@lamolina.edu.pe');
insert into universidad values ('302', 'Universidad Nacional Mayor de San Marcos', 'Ca. Germán Amézaga 375, Cercado de Lima, Lima', '6197000', 'occaa@unmsm.edu.pe');
insert into universidad values ('303', 'Universidad Nacional de Ingeniería', 'Av. Túpac Amaru 210, Rímac, Lima', '4811070', 'ctic@uni.edu.pe');
insert into universidad values ('304', 'Pontificia Universidad Católica del Perú', 'Av. Universitaria 1801, San Miguel, Lima', '6262000', 'mesadepartes.dptoeducacion@pucp.edu.pe');
insert into universidad values ('305', 'Universidad San Ignacio de Loyola', 'Av. La Fontana 750, La Molina, Lima', '3171050', 'atencionalumno@usil.edu.pe');
insert into universidad values ('306', 'Universidad Tecnológica del Perú', 'Av. Arequipa 265, Cercado de Lima, Lima', '3159610', 'admision@utp.edu.pe');
insert into universidad values ('307', 'Universidad de Lima', 'Av. Javier Prado Este 4600, Santiago de Surco, Lima', '4376767', 'dusarorientacion@ulima.edu.pe');
insert into universidad values ('308', 'Universidad Peruana Cayetano Heredia', 'Av. Honorio Delgado 430, San Martín de Porres, Lima', '3190000', 'ouic@oficinas-upch.pe');

select Nombre_Curso from curso where Duración_Curso = 5;
select Nombre_Curso from curso where Duración_Curso = 6;
select Nombre_Universidad from universidad where Dirección_Universidad like '%Cercado de Lima%';
select Nombre_Universidad from universidad where Dirección_Universidad like '%La Molina%';
select Nombre_Universidad from universidad where Nombre_Universidad like '%Nacional%';

INSERT INTO POSTULANTE values (1, 'Ingeniería', 2020, 'Juan', 'Pérez', 'juan.perez@email.com', '+1234567890', 301);
INSERT INTO POSTULANTE values (2, 'Medicina', 2019, 'María', 'Gómez', 'maria.gomez@email.com', '+9876543210', 301);
INSERT INTO POSTULANTE values (3, 'Derecho', 2021, 'Carlos', 'López', 'carlos.lopez@email.com', '+1122334455', 302);
INSERT INTO POSTULANTE values (4, 'Administración', 2020, 'Ana', 'Martínez', 'ana.martinez@email.com', '+5566778899', 303);
INSERT INTO POSTULANTE values (5, 'Arquitectura', 2018, 'Luisa', 'Rodríguez', 'luisa.rodriguez@email.com', '+9988776655', 302);

INSERT INTO PUESTO_TRABAJO (ID_Puesto, Titulo_Puesto, Descripción_Puesto, Fecha_Publicación, Vacantes) VALUES
(401, 'Desarrollador Backend', 'Desarrollo de APIs con Java y Spring Boot', '2023-10-15', 3),
(402, 'Asistente Legal', 'Apoyo en investigación jurídica y documentación', '2023-10-20', 2),
(403, 'Practicante de Marketing', 'Gestión de redes sociales y campañas digitales', '2023-10-10', 5),
(404, 'Ingeniero Civil', 'Diseño y supervisión de proyectos de construcción', '2023-10-05', 1),
(405, 'Enfermero/a', 'Cuidado de pacientes en turnos rotativos', '2023-10-18', 4);

-- Datos para la tabla ESTUD_CURSO
INSERT INTO ESTUD_CURSO (ID_Postulante, ID_Curso, Fecha_Curso, Estado_Curso) VALUES
(1, 100, '2023-03-10', 'Aprobado'),
(1, 104, '2023-04-15', 'Aprobado'),
(2, 107, '2022-08-20', 'En curso'),
(2, 110, '2022-09-10', 'Aprobado'),
(3, 106, '2023-01-12', 'Aprobado'),
(3, 114, '2023-03-22', 'En curso'),
(4, 101, '2021-07-11', 'Aprobado'),
(4, 105, '2021-08-10', 'Aprobado'),
(5, 108, '2022-11-05', 'Aprobado'),
(5, 109, '2022-12-01', 'En curso');

-- Datos para la tabla VACANTE
INSERT INTO VACANTE (ID_Vacante, Fecha_Postulación, Estado_Postulación, ID_Postulante, ID_Puesto) VALUES
(201, '2023-11-01', 'Aceptado', 1, 401),
(202, '2023-11-03', 'Pendiente', 2, 405),
(203, '2023-11-05', 'Rechazado', 3, 402),
(204, '2023-11-06', 'Aceptado', 4, 403),
(205, '2023-11-07', 'Pendiente', 5, 404);

-- Consultas

SELECT 
    CONCAT(p.Nombre, ' ', p.Apellido) AS Postulante,
    c.Nombre_Curso AS Curso_Aprobado,
    ec.Fecha_Curso,
    u.Nombre_Universidad AS Universidad
FROM 
    POSTULANTE p
JOIN 
    ESTUD_CURSO ec ON p.ID_Postulante = ec.ID_Postulante
JOIN 
    CURSO c ON ec.ID_Curso = c.ID_Curso
JOIN 
    UNIVERSIDAD u ON p.ID_Universidad = u.ID_Universidad
WHERE 
    u.ID_Universidad = '301' 
    AND ec.Estado_Curso = 'Aprobado'
ORDER BY 
    p.Nombre;