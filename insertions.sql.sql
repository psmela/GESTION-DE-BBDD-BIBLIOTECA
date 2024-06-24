INSERT INTO libro (id_libro, titulo, autor, isbn, categoria, editorial, fecha_de_publicacion, estado)
VALUES
(1, 'El principito', 'Antoine de Saint-Exupéry', '9789876121020', 'Infantil', 'Salvat', '1943-04-06', 'disponible'),
(2, 'Cien años de soledad', 'Gabriel García Márquez', '9780307474728', 'Ficción', 'Vintage Books', '1967-05-30', 'disponible'),
(3, 'Don Quijote de la Mancha', 'Miguel de Cervantes', '9788424117386', 'Clásico', 'Espasa-Calpe', '1605-01-01', 'disponible'),
(4, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', '9788478884450', 'Fantasía', 'Salamandra', '1997-06-26', 'disponible'),
(5, '1984', 'George Orwell', '9788499890956', 'Ciencia ficción', 'Debolsillo', '1949-06-08', 'disponible'),
(6, 'Orgullo y prejuicio', 'Jane Austen', '9788497940497', 'Romántica', 'Penguin Clásicos', '1813-01-28', 'disponible'),
(7, 'El señor de los anillos', 'J.R.R. Tolkien', '9788445004570', 'Fantasía', 'Minotauro', '1954-07-29', 'disponible'),
(8, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', '9780307474728', 'Ficción', 'Vintage Espanol', '1981-05-01', 'disponible'),
(9, 'El alquimista', 'Paulo Coelho', '9780062511409', 'Ficción', 'HarperOne', '1988-01-01', 'disponible'),
(10, 'El código Da Vinci', 'Dan Brown', '9780307474278', 'Misterio', 'Vintage Espanol', '2003-03-18', 'disponible'),
(11, 'La sombra del viento', 'Carlos Ruiz Zafón', '9788408172175', 'Ficción', 'Planeta', '2001-04-01', 'prestado'),
(12, 'El nombre del viento', 'Patrick Rothfuss', '9788498385442', 'Fantasía', 'Plaza & Janés', '2007-03-27', 'prestado'),
(13, 'Matar a un ruiseñor', 'Harper Lee', '9780060935467', 'Clásico', 'J.B. Lippincott & Co.', '1960-07-11', 'prestado'),
(14, 'La chica del tren', 'Paula Hawkins', '9781594634024', 'Misterio', 'Riverhead Books', '2015-01-13', 'prestado');

INSERT INTO usuario (id_usuario, nombre, apellido, direccion, telefono, email)
VALUES
(1, 'Roberto', 'Milei', 'San Martin 789', 249455677, 'robertomilei@gmail.com'),
(2, 'Celeste', 'Muriega', 'Chacabuco 1011', 249455339, 'celestemuriega@hotmail.com'),
(3, 'Luis', 'González', 'Piedrabuena 456', 249477159, 'luis@hotmail.com'),
(4, 'Ana', 'Rodríguez', 'Avenida del Valle 789', 249234679, 'ana@gmail.com'),
(5, 'Carlos', 'Martínez', 'Colon 1011', 249734789, 'carlos@yahoo.com'),
(6, 'María', 'López', 'Ugarte 1213', 249456789, 'maria@hotmail.com'),
(7, 'Pedro', 'Gómez', 'Avenida Peron 1415', 249567890, 'pedro@gmail.com'),
(8, 'Laura', 'Fernández', 'Irigoyen 1617', 249010112, 'laura@hotmail.com');

INSERT INTO bibliotecario (id_bibliotecario, nombre, apellido, direccion, telefono)
VALUES
(1, 'Javier', 'García', 'Avenida Actis 200', 249442233),
(2, 'Magdalena', 'Hernández', 'Avenida Siempre Viva 1011', 249438865);

INSERT INTO prestamo (id_prestamo, id_usuario, id_libro, id_bibliotecario, fecha_prestamo, fecha_vencimiento, fecha_devolucion)
VALUES
-- Préstamos devueltos a tiempo
(1, 1, 1, 1, '2024-01-15', '2024-02-15', '2024-02-14'),
(2, 2, 2, 1, '2024-01-20', '2024-02-20', '2024-02-18'),

-- Préstamos devueltos tarde
(3, 3, 3, 2, '2024-01-25', '2024-02-25', '2024-03-01'),
(4, 4, 4, 2, '2024-01-30', '2024-03-01', '2024-03-05'),

-- Préstamos no devueltos (aún dentro del plazo)
(5, 5, 5, 1, '2024-06-01', '2024-07-01', NULL),
(6, 6, 6, 2, '2024-06-05', '2024-07-05', NULL),

-- Préstamos no devueltos (atrasados)
(7, 7, 7, 1, '2024-05-01', '2024-06-01', NULL),
(8, 8, 8, 2, '2024-04-15', '2024-05-15', NULL);