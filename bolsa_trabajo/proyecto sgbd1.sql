
CREATE DATABASE IF NOT EXISTS trabajo;
USE trabajo; 


CREATE TABLE UNIVERSIDAD (
    ID_Universidad INT(11) NOT NULL PRIMARY KEY,
    Nombre_Universidad VARCHAR(100) NOT NULL,
    Dirección_Universidad VARCHAR(150) NOT NULL,
    Teléfono_Universidad VARCHAR(11) NOT NULL,
    Email_Universidad VARCHAR(100) NOT NULL
);

CREATE TABLE POSTULANTE (
    ID_Postulante INT(100) NOT NULL PRIMARY KEY,
    Carrera VARCHAR(100) NOT NULL,
    Año_Ingreso YEAR NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Email_Estudiante VARCHAR(100) NOT NULL,
    Teléfono_Estudiante VARCHAR(40) NOT NULL,
    ID_Universidad INT(11) NOT NULL,
    FOREIGN KEY (ID_Universidad) REFERENCES UNIVERSIDAD(ID_Universidad)
);

CREATE TABLE CURSO (
    ID_Curso INT(11) NOT NULL PRIMARY KEY,
    Nombre_Curso VARCHAR(40) NOT NULL,
    Descripción_Curso VARCHAR(100) NOT NULL,
    Duración_Curso INT(11) NOT NULL
);

CREATE TABLE ESTUD_CURSO  (
    ID_Postulante INT(11) NOT NULL,
    ID_Curso INT(11) NOT NULL,
    Fecha_Curso DATE NOT NULL,
    Estado_Curso VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID_Postulante, ID_Curso),
    FOREIGN KEY (ID_Postulante) REFERENCES POSTULANTE(ID_Postulante),
    FOREIGN KEY (ID_Curso) REFERENCES CURSO(ID_Curso)
);

CREATE TABLE PUESTO_TRABAJO (
    ID_Puesto INT(11) NOT NULL PRIMARY KEY,
    Titulo_Puesto VARCHAR(50) NOT NULL,
    Descripción_Puesto VARCHAR(100) NOT NULL,
    Fecha_Publicación DATE NOT NULL,
    Vacantes INT(11) NOT NULL
);

CREATE TABLE VACANTE (
    ID_Vacante INT(11) NOT NULL PRIMARY KEY,
    Fecha_Postulación DATE NOT NULL,
    Estado_Postulación VARCHAR(40) NOT NULL,
    ID_Postulante INT(11) NOT NULL,
    ID_Puesto INT(11) NOT NULL,
    FOREIGN KEY (ID_Postulante) REFERENCES POSTULANTE(ID_Postulante),
    FOREIGN KEY (ID_Puesto) REFERENCES PUESTO_TRABAJO(ID_Puesto)
);

show databases;
show tables;
select*from curso;

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

# DATOS DE POSTULANTES
USE 	
select*from postulante;

SHOW DATABASES;
insert into postulante  Values
(20203612, 'Estadistica Informatica', 2020, 'Ana Lucía', 'Fernández Rodríguez', '20201686@lamolina.edu.pe', '+51 987729847', 301),
(20201551, 'Estadistica Informatica', 2020, 'José', 'Pérez López', '20201435@lamolina.edu.pe', '+51 987965818', 301),
(20203155, 'Estadistica Informatica', 2020, 'María', 'González Sánchez', '20202242@lamolina.edu.pe', '+51 987927047', 301),
(20203132, 'Ingenieria en gestion empresarial', 2020, 'Luis Alberto', 'Díaz Ramírez', '20202463@lamolina.edu.pe', '+51 987164305', 301),
(20205809, 'Ingenieria en gestion empresarial', 2020, 'Sofía', 'Hernández Mendoza', '20203707@lamolina.edu.pe', '+51 987318826', 301),
(20204428, 'Ingenieria en gestion empresarial', 2020, 'Juan Carlos', 'Gómez Torres', '20203944@lamolina.edu.pe', '+51 987899491', 301),
(20207294, 'Economia', 2020, 'Laura', 'Castro Vázquez', '20202596@lamolina.edu.pe', '+51 987597348', 301),      
(20201295, 'Economia', 2020, 'Miguel Ángel', 'Ruiz Medina', '20203273@lamolina.edu.pe', '+51 987867729', 301),  
(20204091, 'Economia', 2020, 'Elena', 'Delgado Ortega', '20204201@lamolina.edu.pe', '+51 987450063', 301),      
(20201857, 'Economia', 2020, 'Pedro', 'Silva Mendoza', '20207462@lamolina.edu.pe', '+51 987539570', 301),       
(20204482, 'Estadistica Informatica', 2020, 'Carmen Rosa', 'Herrera Vargas', '20203053@lamolina.edu.pe', '+51 987397518', 301),
(20201613, 'Estadistica Informatica', 2020, 'Andrés', 'Núñez Jiménez', '20201443@lamolina.edu.pe', '+51 987722780', 301),
(20204925, 'Estadistica Informatica', 2020, 'Isabel', 'Romero Cruz', '20205035@lamolina.edu.pe', '+51 987341137', 301),
(20202999, 'Estadistica Informatica', 2020, 'Jorge Eduardo', 'Paredes Ríos', '20204154@lamolina.edu.pe', '+51 987799418', 301),
(20204021, 'Estadistica Informatica', 2020, 'Patricia', 'Soto Guzmán', '20203906@lamolina.edu.pe', '+51 987377472', 301),
(20205756, 'Estadistica Informatica', 2020, 'Diego', 'Morales Vega', '20204715@lamolina.edu.pe', '+51 987750023', 301),
(20205464, 'Estadistica Informatica', 2020, 'Adriana', 'Flores Miranda', '20201999@lamolina.edu.pe', '+51 987865747', 301),
(20205085, 'Ingenieria en gestion empresarial', 2020, 'Rafael', 'Ortega Rivas', '20206175@lamolina.edu.pe', '+51 987626580', 301),
(20216609, 'Ingenieria en gestion empresarial', 2021, 'Luisa María', 'Vargas Salazar', '20217020@lamolina.edu.pe', '+51 987742304', 301),
(20216565, 'Ingenieria en gestion empresarial', 2021, 'Fernando', 'Jiménez Peña', '20215069@lamolina.edu.pe', '+51 987888098', 301),
(20216714, 'Economia', 2021, 'Daniela', 'Soto Méndez', '20215895@lamolina.edu.pe', '+51 987771001', 301),       
(20216274, 'Economia', 2021, 'Roberto Carlos', 'Núñez Castillo', '20216512@lamolina.edu.pe', '+51 987272408', 301),
(20217124, 'Economia', 2021, 'Verónica', 'Guzmán Valencia', '20211236@lamolina.edu.pe', '+51 987850158', 301),  
(20216660, 'Estadistica Informatica', 2021, 'Javier', 'Rojas Ibarra', '20211723@lamolina.edu.pe', '+51 987447566', 301),
(20216881, 'Estadistica Informatica', 2021, 'Gloria Esther', 'Medina Fuentes', '20216710@lamolina.edu.pe', '+51 987134434', 301),
(20213747, 'Estadistica Informatica', 2021, 'Ricardo', 'Peña Quintero', '20213853@lamolina.edu.pe', '+51 987163483', 301),
(20211335, 'Estadistica Informatica', 2021, 'Silvia', 'Acosta Cervantes', '20216335@lamolina.edu.pe', '+51 987622078', 301),
(20212687, 'Ingenieria en gestion empresarial', 2021, 'Oscar David', 'Castillo Espinosa', '20213182@lamolina.edu.pe', '+51 987220600', 301),
(20211943, 'Ingenieria en gestion empresarial', 2021, 'Natalia', 'Vega Orozco', '20213383@lamolina.edu.pe', '+51 987770431', 301),
(20214135, 'Ingenieria en gestion empresarial', 2021, 'Hugo', 'Miranda Delgado', '20211270@lamolina.edu.pe', '+51 987555445', 301),
(20213904, 'Economia', 2021, 'Claudia', 'Ríos Mejía', '20214995@lamolina.edu.pe', '+51 987646988', 301),        
(20215294, 'Economia', 2021, 'Francisco Javier', 'Méndez Valdez', '20212604@lamolina.edu.pe', '+51 987843638', 301),
(20215234, 'Economia', 2021, 'Teresa', 'León Solís', '20215443@lamolina.edu.pe', '+51 987928659', 301),
(20212298, 'Economia', 2021, 'Arturo', 'Navarro Cordero', '20214561@lamolina.edu.pe', '+51 987141905', 301),    
(20215093, 'Economia', 2021, 'Gabriela', 'Luna Ponce', '20215181@lamolina.edu.pe', '+51 987760591', 301),       
(20215941, 'Economia', 2021, 'Sergio Andrés', 'Cortés Rosales', '20216657@lamolina.edu.pe', '+51 987870881', 301),
(20217034, 'Economia', 2021, 'Marcela', 'Paredes Contreras', '20214510@lamolina.edu.pe', '+51 987488127', 301), 
(20216157, 'Economia', 2021, 'Ernesto', 'Salazar Montes', '20215395@lamolina.edu.pe', '+51 987174680', 301),    
(20197413, 'Economia', 2019, 'Diana Carolina', 'Reyes Palacios', '20197304@lamolina.edu.pe', '+51 987264502', 301),
(20191637, 'Economia', 2019, 'Eduardo', 'Campos Santana', '20195157@lamolina.edu.pe', '+51 987231795', 301),    
(20192841, 'Economia', 2019, 'Beatriz', 'Valencia Zamora', '20191850@lamolina.edu.pe', '+51 987877954', 301),   
(20192098, 'Economia', 2019, 'Guillermo', 'Ibarra Carmona', '20195562@lamolina.edu.pe', '+51 987612929', 301),  
(20194288, 'Estadistica Informatica', 2019, 'Rosa Elena', 'Fuentes Rangel', '20192308@lamolina.edu.pe', '+51 987378106', 301),
(20197568, 'Estadistica Informatica', 2019, 'Alejandro', 'Mora Cabrera', '20192064@lamolina.edu.pe', '+51 987667525', 301),
(20195599, 'Estadistica Informatica', 2019, 'Julia', 'Quintero Osorio', '20192909@lamolina.edu.pe', '+51 987255292', 301),
(20195389, 'Estadistica Informatica', 2019, 'Mario Alberto', 'Cervantes Aguirre', '20196199@lamolina.edu.pe', '+51 987751005', 301),
(20194762, 'Estadistica Informatica', 2019, 'Leticia', 'Espinosa Lara', '20191628@lamolina.edu.pe', '+51 987863499', 301),
(20195225, 'Ingenieria en gestion empresarial', 2019, 'Joaquín', 'Rivas Campos', '20195941@lamolina.edu.pe', '+51 987664178', 301),
(20193613, 'Ingenieria en gestion empresarial', 2019, 'Ana Belén', 'Orozco Franco', '20193724@lamolina.edu.pe', '+51 987693541', 301),
(20197341, 'Ingenieria en gestion empresarial', 2019, 'Víctor Manuel', 'Delgado Segura', '20194812@lamolina.edu.pe', '+51 987856340', 301),
(20196310, 'Economia', 2019, 'Paulina', 'Mejía Tapia', '20195548@lamolina.edu.pe', '+51 987876121', 301),       
(20196079, 'Economia', 2019, 'Ignacio', 'Valdez Gil', '20194373@lamolina.edu.pe', '+51 987986412', 301),        
(20196904, 'Economia', 2019, 'Mariana', 'Solís Serrano', '20197015@lamolina.edu.pe', '+51 987933236', 301),     
(20195175, 'Economia', 2019, 'Samuel', 'Cordero Montes', '20195646@lamolina.edu.pe', '+51 987927373', 301),     
(20207517, 'Derecho', 2020, 'Santiago Nicolás', 'García López', '20205867@unmsm.edu.pe', '+51 987903364', 302), 
(20203560, 'Ingeniería Industrial', 2020, 'Matías Alejandro', 'Rodríguez Martínez', '20202464@unmsm.edu.pe', '+51 987221234', 302),
(20201342, 'Contabilidad', 2020, 'Sebastián Andrés', 'González Pérez', '20205515@unmsm.edu.pe', '+51 987510338', 302),
(20202454, 'Administración', 2020, 'Diego Alejandro', 'Fernández Sánchez', '20201575@unmsm.edu.pe', '+51 987956419', 302),
(20201123, 'Administración', 2020, 'Nicolás Gabriel', 'Díaz Ramírez', '20201932@unmsm.edu.pe', '+51 987331830', 302),
(20203428, 'Contabilidad', 2020, 'Samuel Alejandro', 'Hernández Mendoza', '20206898@unmsm.edu.pe', '+51 987275468', 302),
(20203894, 'Contabilidad', 2020, 'Juan Pablo', 'Gómez Torres', '20204610@unmsm.edu.pe', '+51 987506991', 302),  
(20202284, 'Contabilidad', 2020, 'Juan David', 'Castro Vázquez', '20202390@unmsm.edu.pe', '+51 987515887', 302),
(20206009, 'Contabilidad', 2020, 'Juan Carlos', 'Ruiz Medina', '20205185@unmsm.edu.pe', '+51 987481252', 302),  
(20202060, 'Contabilidad', 2020, 'Juan Sebastián', 'Delgado Ortega', '20201284@unmsm.edu.pe', '+51 987728421', 302),
(20205352, 'Administración', 2020, 'Luis Miguel', 'Silva Mendoza', '20203042@unmsm.edu.pe', '+51 987200318', 302),
(20205575, 'Derecho', 2020, 'Luis Fernando', 'Herrera Vargas', '20206286@unmsm.edu.pe', '+51 987580506', 302),  
(20206819, 'Ingeniería Industrial', 2020, 'Carlos Andrés', 'Núñez Jiménez', '20204314@unmsm.edu.pe', '+51 987552285', 302),
(20206183, 'Derecho', 2020, 'Carlos Eduardo', 'Romero Cruz', '20205143@unmsm.edu.pe', '+51 987609203', 302),    
(20205892, 'Ingeniería Industrial', 2020, 'Javier Alejandro', 'Paredes Ríos', '20204796@unmsm.edu.pe', '+51 987724927', 302),
(20206612, 'Derecho', 2020, 'Javier Ignacio', 'Soto Guzmán', '20204200@unmsm.edu.pe', '+51 987683322', 302),    
(20201122, 'Derecho', 2020, 'Andrés Felipe', 'Morales Vega', '20206842@unmsm.edu.pe', '+51 987601484', 302),    
(20206388, 'Derecho', 2020, 'Felipe Andrés', 'Flores Miranda', '20207202@unmsm.edu.pe', '+51 987835838', 302),  
(20202248, 'Derecho', 2020, 'Alejandro José', 'Ortega Rivas', '20207422@unmsm.edu.pe', '+51 987779162', 302),   
(20214743, 'Derecho', 2021, 'José Manuel', 'Vargas Salazar', '20216940@unmsm.edu.pe', '+51 987358661', 302),    
(20216066, 'Derecho', 2021, 'José Luis', 'Jiménez Peña', '20215841@unmsm.edu.pe', '+51 987628727', 302),        
(20211374, 'Ingeniería Industrial', 2021, 'José Antonio', 'Soto Méndez', '20213856@unmsm.edu.pe', '+51 987324381', 302),
(20217547, 'Contabilidad', 2021, 'José Miguel', 'Núñez Castillo', '20217157@unmsm.edu.pe', '+51 987309247', 302),
(20212689, 'Administración', 2021, 'José Eduardo', 'Guzmán Valencia', '20216973@unmsm.edu.pe', '+51 987901444', 302),
(20216271, 'Administración', 2021, 'David Alejandro', 'Rojas Ibarra', '20216982@unmsm.edu.pe', '+51 987483778', 302),
(20213981, 'Contabilidad', 2021, 'David Eduardo', 'Medina Fuentes', '20211500@unmsm.edu.pe', '+51 987863188', 302),
(20216879, 'Contabilidad', 2021, 'Daniel Alejandro', 'Peña Quintero', '20212326@unmsm.edu.pe', '+51 987431863', 302),
(20213078, 'Contabilidad', 2021, 'Daniel Eduardo', 'Acosta Cervantes', '20211977@unmsm.edu.pe', '+51 987133747', 302),
(20213947, 'Contabilidad', 2021, 'Miguel Ángel', 'Castillo Espinosa', '20213019@unmsm.edu.pe', '+51 987505982', 302),
(20211816, 'Contabilidad', 2021, 'Miguel Eduardo', 'Vega Orozco', '20211547@unmsm.edu.pe', '+51 987740065', 302),
(20214176, 'Administración', 2021, 'Ricardo Antonio', 'Miranda Delgado', '20214385@unmsm.edu.pe', '+51 987267645', 302),
(20212946, 'Derecho', 2021, 'Ricardo José', 'Ríos Mejía', '20215190@unmsm.edu.pe', '+51 987682119', 302),
(20215722, 'Ingeniería Industrial', 2021, 'Roberto Carlos', 'Méndez Valdez', '20214123@unmsm.edu.pe', '+51 987649096', 302),
(20214884, 'Derecho', 2021, 'Roberto Andrés', 'León Solís', '20213178@unmsm.edu.pe', '+51 987532314', 302),     
(20213555, 'Ingeniería Industrial', 2021, 'Fernando José', 'Navarro Cordero', '20214552@unmsm.edu.pe', '+51 987147041', 302),
(20216218, 'Derecho', 2021, 'Fernando Alejandro', 'Luna Ponce', '20214338@unmsm.edu.pe', '+51 987619520', 302), 
(20214870, 'Derecho', 2021, 'Eduardo José', 'Cortés Rosales', '20215641@unmsm.edu.pe', '+51 987724104', 302),   
(20215088, 'Derecho', 2021, 'Eduardo Antonio', 'Paredes Contreras', '20215804@unmsm.edu.pe', '+51 987774528', 302),
(20212801, 'Ingeniería Industrial', 2021, 'Jorge Luis', 'Salazar Montes', '20212025@unmsm.edu.pe', '+51 987685848', 302),
(20193734, 'Contabilidad', 2019, 'Jorge Alberto', 'Reyes Palacios', '20194504@unmsm.edu.pe', '+51 987501434', 302),
(20191746, 'Administración', 2019, 'Jorge Eduardo', 'Campos Santana', '20191251@unmsm.edu.pe', '+51 987855341', 302),
(20196749, 'Administración', 2019, 'Pedro Pablo', 'Valencia Zamora', '20191689@unmsm.edu.pe', '+51 987328958', 302),
(20192340, 'Contabilidad', 2019, 'Pedro Antonio', 'Ibarra Carmona', '20196966@unmsm.edu.pe', '+51 987232330', 302),
(20192847, 'Contabilidad', 2019, 'Francisco José', 'Fuentes Rangel', '20193051@unmsm.edu.pe', '+51 987290257', 302),
(20191614, 'Contabilidad', 2019, 'Francisco Javier', 'Mora Cabrera', '20197371@unmsm.edu.pe', '+51 987722680', 302),
(20194388, 'Contabilidad', 2019, 'Gabriel Alejandro', 'Quintero Osorio', '20192794@unmsm.edu.pe', '+51 987669819', 302),
(20197065, 'Contabilidad', 2019, 'Gabriel Antonio', 'Cervantes Aguirre', '20191847@unmsm.edu.pe', '+51 987552722', 302),
(20192377, 'Administración', 2019, 'Manuel Alejandro', 'Espinosa Lara', '20193388@unmsm.edu.pe', '+51 987634909', 302),
(20195492, 'Derecho', 2019, 'Manuel Antonio', 'Rivas Campos', '20194711@unmsm.edu.pe', '+51 987639928', 302),   
(20193536, 'Ingeniería Industrial', 2019, 'Armando José', 'Orozco Franco', '20191831@unmsm.edu.pe', '+51 987992053', 302),
(20194362, 'Derecho', 2019, 'Rodrigo Arturo', 'Delgado Segura', '20194473@unmsm.edu.pe', '+51 987794936', 302), 
(20194984, 'Ingeniería Industrial', 2019, 'Gustavo Adolfo', 'Mejía Tapia', '20195474@unmsm.edu.pe', '+51 987786553', 302),
(20194037, 'Derecho', 2019, 'Renato Alonso', 'Valdez Gil', '20193324@unmsm.edu.pe', '+51 987989617', 302),      
(20191897, 'Derecho', 2019, 'Héctor Enrique', 'Solís Serrano', '20196521@unmsm.edu.pe', '+51 987634229', 302),
(20196903, 'Derecho', 2019, 'Lorenzo Javier', 'Cordero Montes', '20193870@unmsm.edu.pe', '+51 987369519', 302), 
(20182496, 'Ingeniería Industrial', 2018, 'Alberto José', 'Rocha Navarro', '20185631@unmsm.edu.pe', '+51 987252423', 302),
(20186664, 'Ingeniería Industrial', 2018, 'Fabián Alejandro', 'Mendoza Peña', '20185383@unmsm.edu.pe', '+51 987991699', 302),
(20181898, 'Ingeniería Industrial', 2018, 'Adrián Marcelo', 'Suárez Vega', '20186193@unmsm.edu.pe', '+51 987134648', 302),
(20184541, 'Ingeniería Industrial', 2018, 'Raúl Antonio', 'Guzmán Soto', '20185258@unmsm.edu.pe', '+51 987512632', 302),
(20181227, 'Ingeniería Industrial', 2018, 'Óscar Eduardo', 'Ramírez Castro', '20185510@unmsm.edu.pe', '+51 987619774', 302),
(20182530, 'Ingeniería Industrial', 2018, 'Víctor Manuel', 'Ponce León', '20184147@unmsm.edu.pe', '+51 987538181', 302),
(20182707, 'Ingeniería Civil', 2018, 'Mauricio Alejandro', 'Montesinos Ríos', '20181932@uni.edu.pe', '+51 987462903', 303),
(20185395, 'Ingeniería de Sistemas', 2018, 'Arturo José', 'Del Valle Herrera', '20181984@uni.edu.pe', '+51 987484319', 303),
(20184518, 'Ingeniería de Sistemas', 2018, 'Enrique Alberto', 'Orellana Paz', '20184605@uni.edu.pe', '+51 987637434', 303),
(20185137, 'Ingeniería de Sistemas', 2018, 'Sergio Andrés', 'Medina Rojas', '20182541@uni.edu.pe', '+51 987609213', 303),
(20184188, 'Ingeniería Civil', 2018, 'Ernesto Antonio', 'Rangel Fuentes', '20183480@uni.edu.pe', '+51 987812592', 303),
(20184229, 'Ingeniería Civil', 2018, 'Guillermo Antonio', 'Carmona Silva', '20183739@uni.edu.pe', '+51 987456889', 303),
(20185573, 'Ingeniería Civil', 2018, 'Rafael Alejandro', 'Soto Díaz', '20184626@uni.edu.pe', '+51 987659639', 303),
(20181770, 'Ingeniería de Sistemas', 2018, 'Marco Antonio', 'Zamora Flores', '20187268@uni.edu.pe', '+51 987974018', 303),
(20185330, 'Ingeniería de Sistemas', 2018, 'César Augusto', 'López Méndez', '20183723@uni.edu.pe', '+51 987214067', 303),
(20185349, 'Ingeniería de Sistemas', 2018, 'Julio César', 'Valencia Castro', '20186346@uni.edu.pe', '+51 987836090', 303),
(20186876, 'Ingeniería Civil', 2018, 'Ignacio José', 'Reyes Paredes', '20187587@uni.edu.pe', '+51 987971924', 303),
(20181600, 'Ingeniería Civil', 2018, 'Emilio José', 'Gil Ortega', '20184179@uni.edu.pe', '+51 987910209', 303), 
(20181215, 'Ingeniería Civil', 2018, 'Agustín José', 'Mora Cervantes', '20182817@uni.edu.pe', '+51 987381309', 303),
(20211376, 'Ingeniería de Sistemas', 2021, 'Gerardo Antonio', 'Contreras Salazar', '20217199@uni.edu.pe', '+51 987285563', 303),
(20214217, 'Ingeniería de Sistemas', 2021, 'Erick Alejandro', 'Rosales Vega', '20217400@uni.edu.pe', '+51 987309183', 303),
(20216699, 'Ingeniería de Sistemas', 2021, 'Alan Gabriel', 'Lara Campos', '20216937@uni.edu.pe', '+51 987460094', 303),
(20214408, 'Ingeniería Civil', 2021, 'Axel Daniel', 'Franco Tapia', '20211211@uni.edu.pe', '+51 987920116', 303),
(20212856, 'Ingeniería Civil', 2021, 'Iván Alejandro', 'García Martínez', '20214459@uni.edu.pe', '+51 987605021', 303),
(20213505, 'Arquitectura', 2021, 'Santiago Nicolás', 'Rodríguez Sánchez', '20212424@uni.edu.pe', '+51 987395464', 303),
(20214393, 'Arquitectura', 2021, 'Matías Alejandro', 'González Ramírez', '20213446@uni.edu.pe', '+51 987452067', 303),
(20213948, 'Arquitectura', 2021, 'Sebastián Andrés', 'Fernández Mendoza', '20212853@uni.edu.pe', '+51 987686150', 303),
(20215704, 'Arquitectura', 2021, 'Diego Alejandro', 'Díaz Torres', '20212391@uni.edu.pe', '+51 987413811', 303),
(20214020, 'Arquitectura', 2021, 'Nicolás Gabriel', 'Hernández Vázquez', '20215012@uni.edu.pe', '+51 987547592', 303),
(20215544, 'Ingeniería de Sistemas', 2021, 'Samuel Alejandro', 'Gómez Medina', '20216256@uni.edu.pe', '+51 987683741', 303),
(20217016, 'Ingeniería de Sistemas', 2021, 'Juan Pablo', 'Castro Ortega', '20213001@uni.edu.pe', '+51 987622341', 303),
(20214001, 'Ingeniería de Sistemas', 2021, 'Juan David', 'Ruiz Mendoza', '20214998@uni.edu.pe', '+51 987971907', 303),
(20216645, 'Ingeniería Civil', 2021, 'Juan Carlos', 'Delgado Vargas', '20214049@uni.edu.pe', '+51 987484993', 303),
(20216835, 'Ingeniería Civil', 2021, 'Juan Sebastián', 'Silva Jiménez', '20211175@uni.edu.pe', '+51 987899781', 303),
(20214665, 'Arquitectura', 2021, 'Luis Miguel', 'Herrera Cruz', '20216213@uni.edu.pe', '+51 987157464', 303),   
(20212396, 'Arquitectura', 2021, 'Luis Fernando', 'Núñez Ríos', '20216630@uni.edu.pe', '+51 987631933', 303),   
(20214207, 'Arquitectura', 2021, 'Carlos Andrés', 'Romero Guzmán', '20216637@uni.edu.pe', '+51 987445000', 303),
(20212825, 'Arquitectura', 2021, 'Carlos Eduardo', 'Paredes Vega', '20211092@uni.edu.pe', '+51 987706052', 303),
(20215739, 'Ingeniería de Sistemas', 2021, 'Javier Alejandro', 'Soto Miranda', '20211284@uni.edu.pe', '+51 987275042', 303),
(20191935, 'Ingeniería de Sistemas', 2019, 'Javier Ignacio', 'Morales Rivas', '20197439@uni.edu.pe', '+51 987976584', 303),
(20194147, 'Ingeniería de Sistemas', 2019, 'Andrés Felipe', 'Flores Salazar', '20196956@uni.edu.pe', '+51 987236157', 303),
(20195368, 'Ingeniería Civil', 2019, 'Felipe Andrés', 'Ortega Peña', '20196966@uni.edu.pe', '+51 987390405', 303),
(20193983, 'Ingeniería Civil', 2019, 'Alejandro José', 'Vargas Méndez', '20194094@uni.edu.pe', '+51 987974491', 303),
(20191766, 'Arquitectura', 2019, 'José Manuel', 'Jiménez Castillo', '20193147@uni.edu.pe', '+51 987525613', 303),
(20191991, 'Arquitectura', 2019, 'José Luis', 'Soto Valencia', '20192983@uni.edu.pe', '+51 987383246', 303),    
(20194481, 'Arquitectura', 2019, 'José Antonio', 'Núñez Ibarra', '20191885@uni.edu.pe', '+51 987388265', 303),  
(20192415, 'Arquitectura', 2019, 'José Miguel', 'Guzmán Fuentes', '20192526@uni.edu.pe', '+51 987742909', 303), 
(20195038, 'Ingeniería Civil', 2019, 'José Eduardo', 'Rojas Quintero', '20194049@uni.edu.pe', '+51 987447899', 303),
(20194579, 'Ingeniería Civil', 2019, 'David Alejandro', 'Medina Cervantes', '20194464@uni.edu.pe', '+51 987454279', 303),
(20193027, 'Marketing', 2019, 'David Eduardo', 'Peña Espinosa', '20194624@pucp.edu.pe', '+51 987735435', 304),  
(20191509, 'Economia', 2019, 'Daniel Alejandro', 'Acosta Lara', '20193713@pucp.edu.pe', '+51 987529027', 304),  
(20192592, 'Economia', 2019, 'Daniel Eduardo', 'Castillo Campos', '20193465@pucp.edu.pe', '+51 987996637', 304),
(20197205, 'Psicologia', 2019, 'Miguel Ángel', 'Vega Franco', '20196710@pucp.edu.pe', '+51 987559614', 304),    
(20196480, 'Marketing', 2019, 'Miguel Eduardo', 'Miranda Segura', '20197108@pucp.edu.pe', '+51 987937598', 304),
(20194185, 'Marketing', 2019, 'Ricardo Antonio', 'Ríos Tapia', '20195788@pucp.edu.pe', '+51 987761767', 304),   
(20202652, 'Economia', 2020, 'Ricardo José', 'Méndez Gil', '20202762@pucp.edu.pe', '+51 987817304', 304),       
(20207036, 'Economia', 2020, 'Roberto Carlos', 'León Serrano', '20205345@pucp.edu.pe', '+51 987368111', 304),   
(20202364, 'Psicologia', 2020, 'Roberto Andrés', 'Navarro Montes', '20201652@pucp.edu.pe', '+51 987630727', 304),
(20206811, 'Marketing', 2020, 'Fernando José', 'Luna Navarro', '20207306@pucp.edu.pe', '+51 987408988', 304),   
(20201083, 'Marketing', 2020, 'Fernando Alejandro', 'Cortés Peña', '20201799@pucp.edu.pe', '+51 987352311', 304),
(20204314, 'Economia', 2020, 'Eduardo José', 'Paredes Vega', '20202715@pucp.edu.pe', '+51 987488145', 304),     
(20203247, 'Economia', 2020, 'Eduardo Antonio', 'Salazar Soto', '20207250@pucp.edu.pe', '+51 987555298', 304),  
(20202298, 'Psicologia', 2020, 'Jorge Luis', 'Reyes Castro', '20203295@pucp.edu.pe', '+51 987756158', 304),     
(20203842, 'Marketing', 2020, 'Jorge Alberto', 'Campos León', '20204238@pucp.edu.pe', '+51 987630047', 304),    
(20201262, 'Marketing', 2020, 'Jorge Eduardo', 'Valencia Ríos', '20202131@pucp.edu.pe', '+51 987605724', 304),  
(20205873, 'Economia', 2020, 'Pedro Pablo', 'Ibarra Herrera', '20205378@pucp.edu.pe', '+51 987600175', 304),    
(20205127, 'Economia', 2020, 'Pedro Antonio', 'Fuentes Paz', '20202693@pucp.edu.pe', '+51 987958321', 304),     
(20204559, 'Psicologia', 2020, 'Francisco José', 'Mora Rojas', '20204456@pucp.edu.pe', '+51 987979737', 304),   
(20206471, 'Marketing', 2020, 'Francisco Javier', 'Quintero Fuentes', '20205092@pucp.edu.pe', '+51 987834878', 304),
(20205373, 'Marketing', 2020, 'Gabriel Alejandro', 'Cervantes Silva', '20204013@pucp.edu.pe', '+51 987856294', 304),
(20202515, 'Economia', 2020, 'Gabriel Antonio', 'Espinosa Díaz', '20207527@pucp.edu.pe', '+51 987473855', 304), 
(20207570, 'Economia', 2020, 'Manuel Alejandro', 'Rivas Flores', '20202888@pucp.edu.pe', '+51 987231648', 304), 
(20201390, 'Psicologia', 2020, 'Manuel Antonio', 'Orozco Méndez', '20202083@pucp.edu.pe', '+51 987255268', 304),
(20201532, 'Marketing', 2020, 'Armando José', 'Delgado Castro', '20206532@pucp.edu.pe', '+51 987310805', 304),  
(20213398, 'Marketing', 2021, 'Rodrigo Arturo', 'Mejía Ortega', '20217405@pucp.edu.pe', '+51 987866201', 304),  
(20212451, 'Economia', 2021, 'Gustavo Adolfo', 'Valdez Mendoza', '20213448@pucp.edu.pe', '+51 987598971', 304), 
(20213997, 'Economia', 2021, 'Renato Alonso', 'Solís Vargas', '20211303@pucp.edu.pe', '+51 987452393', 304),    
(20213050, 'Psicologia', 2021, 'Héctor Enrique', 'Cordero Jiménez', '20212436@pucp.edu.pe', '+51 987655457', 304),
(20213543, 'Marketing', 2021, 'Lorenzo Javier', 'Rocha Cruz', '20212448@pucp.edu.pe', '+51 987423150', 304),    
(20215280, 'Marketing', 2021, 'Alberto José', 'Mendoza Ríos', '20213451@pucp.edu.pe', '+51 987390128', 304),    
(20215320, 'Economia', 2021, 'Fabián Alejandro', 'Suárez Guzmán', '20214607@pucp.edu.pe', '+51 987802082', 304),
(20215140, 'Economia', 2021, 'Adrián Marcelo', 'Guzmán Vega', '20213430@pucp.edu.pe', '+51 987738150', 304),    
(20214209, 'Psicologia', 2021, 'Raúl Antonio', 'Ramírez Miranda', '20214320@pucp.edu.pe', '+51 987679269', 304),
(20214696, 'Marketing', 2021, 'Óscar Eduardo', 'Ponce Rivas', '20214594@pucp.edu.pe', '+51 987933461', 304),    
(20216241, 'Marketing', 2021, 'Víctor Manuel', 'Montesinos Salazar', '20213039@pucp.edu.pe', '+51 987544440', 304),
(20216658, 'Economia', 2021, 'Mauricio Alejandro', 'Del Valle Peña', '20217350@pucp.edu.pe', '+51 987956710', 304),
(20216797, 'Economia', 2021, 'Arturo José', 'Orellana Méndez', '20216908@pucp.edu.pe', '+51 987133781', 304),   
(20213923, 'Psicologia', 2021, 'Enrique Alberto', 'Medina Castillo', '20216225@pucp.edu.pe', '+51 987915934', 304),
(20214635, 'Marketing', 2021, 'Sergio Andrés', 'Rangel Valencia', '20216251@pucp.edu.pe', '+51 987421317', 304),
(20213271, 'Economia', 2021, 'Ernesto Antonio', 'Carmona Ibarra', '20216570@pucp.edu.pe', '+51 987762980', 304),
(20211716, 'Economia', 2021, 'Guillermo Antonio', 'Soto Fuentes', '20211712@pucp.edu.pe', '+51 987559044', 304),
(20212363, 'Psicologia', 2021, 'Rafael Alejandro', 'Zamora Quintero', '20211267@pucp.edu.pe', '+51 987245810', 304),
(20214102, 'Marketing', 2021, 'Marco Antonio', 'López Cervantes', '20212268@pucp.edu.pe', '+51 987974118', 304),
(20217501, 'Economia', 2021, 'César Augusto', 'Valencia Espinosa', '20216788@pucp.edu.pe', '+51 987447148', 304),
(20193806, 'Economia', 2019, 'Julio César', 'Reyes Lara', '20192100@pucp.edu.pe', '+51 987851305', 304),        
(20192877, 'Psicologia', 2019, 'Ignacio José', 'Gil Campos', '20192988@pucp.edu.pe', '+51 987304181', 304),     
(20193518, 'Economia', 2019, 'Emilio José', 'Mora Franco', '20195116@pucp.edu.pe', '+51 987558059', 304),       
(20196614, 'Economia', 2019, 'Agustín José', 'Contreras Segura', '20192312@pucp.edu.pe', '+51 987396425', 304), 
(20192824, 'Psicologia', 2019, 'Gerardo Antonio', 'Rosales Tapia', '20192934@pucp.edu.pe', '+51 987602090', 304),
(20195465, 'Marketing', 2019, 'Erick Alejandro', 'Lara Gil', '20193760@pucp.edu.pe', '+51 987307079', 304),     
(20197377, 'Marketing', 2019, 'Alan Gabriel', 'Franco Serrano', '20194891@pucp.edu.pe', '+51 987538013', 304),  
(20193454, 'Economia', 2019, 'Axel Daniel', 'Ruiz Montes', '20195071@pucp.edu.pe', '+51 987683175', 304);

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
select*from ESTUD_CURSO;

-- Datos para la tabla VACANTE
INSERT INTO VACANTE (ID_Vacante, Fecha_Postulación, Estado_Postulación, ID_Postulante, ID_Puesto) VALUES
(201, '2023-11-01', 'Aceptado', 1, 401),
(202, '2023-11-03', 'Pendiente', 2, 405),
(203, '2023-11-05', 'Rechazado', 3, 402),
(204, '2023-11-06', 'Aceptado', 4, 403),
(205, '2023-11-07', 'Pendiente', 5, 404);
select*from VACANTE;
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
    
select Nombre_Curso from curso where Duración_Curso = 5;
select Nombre_Curso from curso where Duración_Curso = 6;
select Nombre_Universidad from universidad where Dirección_Universidad like '%Cercado de Lima%';
select Nombre_Universidad from universidad where Dirección_Universidad like '%La Molina%';
select Nombre_Universidad from universidad where Nombre_Universidad like '%Nacional%';