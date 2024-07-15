CREATE TABLE Usuarios (
    usuario_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(125),
    telefono NUMERIC(9)
);

CREATE TABLE Razas (
    raza_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Veterinarios (
    veterinario_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    telefono NUMERIC(9)
);

CREATE TABLE Tratamientos (
    tratamiento_id INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(50),
    resultado VARCHAR(100),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE
);

CREATE TABLE Diagnosticos (
    diagnostico_id INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE Mascotas (
    mascota_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    peso DECIMAL(5, 2),
    tratamiento_id INT,
    diagnostico_id INT,
    usuario_id INT,
    raza_id INT,
    FOREIGN KEY (tratamiento_id) REFERENCES Tratamientos(tratamiento_id),
    FOREIGN KEY (raza_id) REFERENCES Razas(raza_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id),
    FOREIGN KEY (diagnostico_id) REFERENCES Diagnosticos(diagnostico_id)
);

CREATE TABLE Citas (
    cita_id INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(50),
    fecha DATE NOT NULL,
    motivo VARCHAR(50),
    correo VARCHAR(50),
    veterinario_id INT,
    mascota_id INT,
    FOREIGN KEY (veterinario_id) REFERENCES Veterinarios(veterinario_id),
    FOREIGN KEY (mascota_id) REFERENCES Mascotas(mascota_id)
);

CREATE TABLE Consultas (
    consulta_id INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE NOT NULL,
    descripcion VARCHAR(50),
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);

CREATE DATABASE PetCareAI;
USE PetCareAI;

INSERT INTO Usuarios (nombre, apellido, direccion, telefono) VALUES ('Juan', 'Perez', 'Av. La Marina 123, Lima', 987654321),
('Maria', 'Gomez', 'Calle Los Pinos 742, San Isidro', 912345678),
('Carlos', 'Lopez', 'Jr. Los Sauces 1234, Miraflores', 989898989),
('Ana', 'Martinez', 'Av. Universitaria 567, San Miguel', 978654321),
('Luis', 'Rodriguez', 'Calle Las Palmeras 101, La Molina', 965432198),
('Jose', 'Hernandez', 'Jr. Los Rosales 22, Surco', 954321987),
('Laura', 'Garcia', 'Av. El Sol 33, Lince', 943219876),
('Marta', 'Fernandez', 'Calle La Luna 44, Barranco', 932198765),
('David', 'Sanchez', 'Jr. El Bosque 55, Ate', 921987654),
('Raul', 'Ramirez', 'Calle Los Cedros 66, San Borja', 910987654),
('Laura', 'Garcia', 'Calle La Paz 110, Chorrillos', 989898788),
('Pedro', 'Mendoza', 'Av. Los Incas 564, San Juan de Lurigancho', 921122334), ('Diana', 'Salazar', 'Jr. Las Flores 220, Rímac', 932198765),
('Karla', 'Suarez', 'Calle Los Pinos 300, Breña', 943219876),
('Fernando', 'Castro', 'Av. La Luna 134, Jesús María', 954321987),
('Gloria', 'Reyes', 'Paseo de los Héroes 101, Magdalena', 965432198),
('Oscar', 'Ortega', 'Calle Los Olivos 411, Pueblo Libre', 976543219),
('Rosa', 'Chavez', 'Av. Independencia 567, Callao', 987654321),
('Mario', 'Alvarez', 'Calle La Palma 202, Villa El Salvador', 998765432),
('Sofia', 'Dominguez', 'Av. Libertad 888, San Martín de Porres', 909876543);



INSERT INTO Razas (nombre) VALUES
('Golden Retriever'),
('Bulldog'),
('Beagle'),
('Poodle'),
('Chihuahua'),
('Labrador Retriever'),
('Pomerania'),
('Dálmata'),
('Pastor Alemán'),
('Husky Siberiano'),
('Rottweiler'),
('Yorkshire Terrier'),
('Persa'),
('Siamés'),
('Maine Coon'),
('Bengalí'),
('Siberiano'),
('Sphynx'),
('Ragdoll'),
('British Shorthair');

INSERT INTO Veterinarios (nombre, telefono) VALUES
('Dr. Juan Pérez', '911223344'),
('Dr. María Ramírez', '922334455'),
('Dr. Carlos Gómez', '933445566'),
('Dr. Ana Torres', '944556677'),
('Dr. Luis Fernández', '955667788');

INSERT INTO Tratamientos (descripcion, resultado, fecha_inicio, fecha_fin) VALUES
('Tratamiento de control anual', 'Revisión anual completada', '2024-01-15', '2024-01-25'),
('Tratamiento para diarrea', 'Diarrea resuelta', '2024-01-20', '2024-02-20'),
('Vacunación anual', 'Vacunación completa', '2024-02-10', '2024-02-15'),
('Tratamiento post-operatorio', 'Recuperación completa', '2024-02-15', '2024-02-16'),
('Tratamiento post-tratamiento', 'Tratamiento exitoso', '2024-03-01', '2024-03-10'),
('Tratamiento de obesidad', 'Peso normal alcanzado', '2024-03-10', '2024-03-20'),
('Tratamiento dental', 'Dientes limpios', '2024-03-20', '2024-04-05'),
('Tratamiento de control de vacunas', 'Vacunación completa', '2024-04-05', '2024-04-15'),
('Tratamiento de control anual', 'Revisión anual completada', '2024-04-15', '2024-05-01'),
('Tratamiento de problema respiratorio', 'Respiración normalizada', '2024-05-01', '2024-05-10'),
('Tratamiento general de salud', 'Salud óptima', '2024-05-10', '2024-05-20'),
('Tratamiento para alergia', 'Alergia controlada', '2024-05-20', '2024-06-01'),
('Tratamiento de control de vacunas', 'Vacunación completa', '2024-06-01', '2024-06-10'),
('Tratamiento general de salud', 'Salud óptima', '2024-06-10', '2024-06-20'),
('Tratamiento post-tratamiento', 'Recuperación completa', '2024-06-20', '2024-07-01'),
('Tratamiento de obesidad', 'Peso normal alcanzado', '2024-07-01', '2024-07-10'),
('Tratamiento dental', 'Dientes limpios', '2024-07-10', '2024-07-20'),
('Tratamiento de control de vacunas', 'Vacunación completa', '2024-07-20', '2024-08-01'),
('Tratamiento de control anual', 'Revisión anual completada', '2024-08-01', '2024-08-10'),
('Tratamiento de problema respiratorio', 'Respiración normalizada', '2024-08-10', NULL);



INSERT INTO Diagnosticos (descripcion, fecha) VALUES
('Consulta anual', '2024-01-15'),
('Diarrea', '2024-01-20'),
('Vacunación', '2024-02-10'),
('Post-operatorio', '2024-02-15'),
('Post-tratamiento', '2024-03-01'),
('Control de peso', '2024-03-10'),
('Revisión dental', '2024-03-20'),
('Control de vacunas', '2024-04-05'),
('Consulta anual', '2024-04-15'),
('Problema respiratorio', '2024-05-01'),
('Salud general', '2024-05-10'),
('Alergia', '2024-05-20'),
('Control de vacunas', '2024-06-01'),
('Salud general', '2024-06-10'),
('Post-tratamiento', '2024-06-20'),
('Control de peso', '2024-07-01'),
('Consulta dental', '2024-07-10'),
('Control de vacunas', '2024-07-20'),
('Consulta anual', '2024-08-01'),
('Problemas respiratorios', '2024-08-10');



INSERT INTO Mascotas (nombre, edad, peso, tratamiento_id, diagnostico_id, usuario_id, raza_id) VALUES
('Bobby', 3, 25.5, 1, 1, 1, 1),
('Bella', 2, 20.0, 2, 2, 2, 2),
('Max', 4, 18.0, 3, 3, 3, 3),
('Lucy', 1, 5.0, 4, 4, 4, 4),
('Rocky', 5, 2.5, 5, 5, 5, 5),
('Daisy', 3, 38.0, 6, 6, 6, 6),
('Coco', 2, 3.5, 7, 7, 7, 7),
('Luna', 4, 25.0, 8, 8, 8, 8),
('Jack', 6, 35.0, 9, 9, 9, 9),
('Milo', 2, 20.0, 10, 10, 10, 10),
('Charlie', 10, 50.0, 11, 11, 11, 11),
('Lily', 4, 4.0, 12, 12, 12, 12),
('Misty', 2, 6.0, 13, 13, 13, 13),
('Simba', 3, 4.5, 14, 14, 14, 14),
('Leo', 1, 10.0, 15, 15, 15, 15),
('Nala', 2, 9.0, 16, 16, 16, 16),
('Oscar', 4, 7.5, 17, 17, 17, 17),
('Whiskers', 3, 5.0, 18, 18, 18, 18),
('Shadow', 5, 6.0, 19, 19, 19, 19),
('Smokey', 2, 5.5, 20, 20, 20, 20);

INSERT INTO Citas (descripcion, fecha, motivo, correo, veterinario_id, mascota_id)
VALUES
    ('Chequeo anual', '2024-01-15', 'Chequeo general', 'juan.perez@gmail.com', 1, 1),
    ('Consulta de emergencia', '2024-01-20', 'Diarrea severa', 'maria.gomez@hotmail.com', 2, 2),
    ('Vacunación', '2024-02-10', 'Vacunas anuales', 'carlos.lopez@outlook.com', 3, 3),
    ('Control post operatorio', '2024-02-15', 'Revisión de cirugía', 'ana.martinez@gmail.com', 4, 4),
    ('Consulta de seguimiento', '2024-03-01', 'Seguimiento de tratamiento', 'luis.rodriguez@hotmail.com', 5, 5),
    ('Control de peso', '2024-03-10', 'Monitoreo de obesidad', 'jose.hernandez@gmail.com', 1, 6),
    ('Revisión dental', '2024-03-20', 'Limpieza dental', 'laura.garcia@outlook.com', 2, 7),
    ('Control de vacunación', '2024-04-05', 'Revisión de vacunas', 'marta.fernandez@gmail.com', 3, 8),
    ('Chequeo general', '2024-04-15', 'Revisión anual', 'david.sanchez@hotmail.com', 4, 9),
    ('Consulta de emergencia', '2024-05-01', 'Problema respiratorio', 'raul.ramirez@gmail.com', 5, 10),
    ('Control de salud', '2024-05-10', 'Evaluación de salud', 'laura.garcia@outlook.com', 1, 11),
    ('Consulta por alergia', '2024-05-20', 'Reacción alérgica', 'pedro.mendoza@outlook.com', 2, 12),
    ('Control de vacunación', '2024-06-01', 'Revisión de vacunas', 'diana.salazar@gmail.com', 3, 13),
    ('Chequeo anual', '2024-06-10', 'Chequeo general', 'karla.suarez@hotmail.com', 4, 14),
    ('Consulta de seguimiento', '2024-06-20', 'Seguimiento de tratamiento', 'fernando.castro@gmail.com', 5, 15),
    ('Control de peso', '2024-07-01', 'Monitoreo de obesidad', 'gloria.reyes@outlook.com', 1, 16),
    ('Revisión dental', '2024-07-10', 'Limpieza dental', 'oscar.ortega@hotmail.com', 2, 17),
    ('Control de vacunación', '2024-07-20', 'Revisión de vacunas', 'rosa.chavez@gmail.com', 3, 18),
    ('Chequeo general', '2024-08-01', 'Revisión anual', 'mario.alvarez@hotmail.com', 4, 19),
    ('Consulta de emergencia', '2024-08-10', 'Problema respiratorio', 'sofia.dominguez@gmail.com', 5, 20);

INSERT INTO Consultas (fecha, descripcion, usuario_id)
VALUES
    ('2024-01-15', 'Consulta anual', 1),
    ('2024-01-20', 'Consulta por diarrea', 2),
    ('2024-02-10', 'Consulta por vacunación', 3),
    ('2024-02-15', 'Consulta post-operatorio', 4),
    ('2024-03-01', 'Consulta post-tratamiento', 5),
    ('2024-03-10', 'Consulta por control de peso', 6),
    ('2024-03-20', 'Revisión dental', 7),
    ('2024-04-05', 'Consulta por control de vacunas', 8),
    ('2024-04-15', 'Consulta anual', 9),
    ('2024-05-01', 'Consulta por problema respiratorio', 10),
    ('2024-05-10', 'Consulta general de salud', 11),
    ('2024-05-20', 'Consulta por alergia', 12),
    ('2024-06-01', 'Consulta por control de vacunas', 13),
    ('2024-06-10', 'Consulta general de salud', 14),
    ('2024-06-20', 'Consulta por post-tratamiento', 15),
    ('2024-07-01', 'Consulta por control de peso', 16),
    ('2024-07-10', 'Consulta dental', 17),
    ('2024-07-20', 'Consulta por control de vacunas', 18),
    ('2024-08-01', 'Consulta anual', 19),
    ('2024-08-10', 'Consulta por problemas respiratorios', 20);


CREATE TRIGGER trg_notificacion_tratamiento
AFTER UPDATE ON Tratamientos
FOR EACH ROW
BEGIN
    IF NEW.resultado = 'Tratamiento exitoso' THEN
        -- Aquí podrías llamar a una función para enviar una notificación
        CALL enviar_notificacion(NEW.tratamiento_id);
    END IF;
END;

CREATE TRIGGER trg_actualizar_diagnostico
AFTER INSERT OR UPDATE ON Tratamientos
FOR EACH ROW
BEGIN
    UPDATE Mascotas
    SET diagnostico_id = (SELECT TOP 1 diagnostico_id FROM Diagnosticos 
                          ORDER BY fecha DESC)
    WHERE tratamiento_id = NEW.tratamiento_id;
END;

CREATE TRIGGER trg_verificar_cita_expirada
AFTER UPDATE ON Citas
FOR EACH ROW
BEGIN
    IF NEW.fecha < CURRENT_DATE THEN
        UPDATE Citas
        SET motivo = 'Cita Expirada'
        WHERE cita_id = NEW.cita_id;
    END IF;
END;

CREATE TRIGGER trg_cambiar_veterinario
AFTER UPDATE ON Citas
FOR EACH ROW
BEGIN
    IF OLD.veterinario_id <> NEW.veterinario_id THEN
        INSERT INTO AuditoriaVeterinarios (cita_id, veterinario_anterior, veterinario_nuevo, fecha_cambio)
        VALUES (NEW.cita_id, OLD.veterinario_id, NEW.veterinario_id, CURRENT_DATE);
    END IF;
END;

CREATE TRIGGER trg_cambiar_tratamiento
AFTER UPDATE ON Mascotas
FOR EACH ROW
BEGIN
    IF OLD.tratamiento_id <> NEW.tratamiento_id THEN
        UPDATE Mascotas
        SET diagnostico_id = NULL -- O cualquier lógica que necesites aplicar
        WHERE mascota_id = NEW.mascota_id;
    END IF;
END;