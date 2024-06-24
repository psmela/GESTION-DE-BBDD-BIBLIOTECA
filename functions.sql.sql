-- PROCEDIMIENTO Y TRANSACCION
DELIMITER //
CREATE PROCEDURE registrar_prestamo(IN p_id_libro INT, IN p_id_usuario INT, IN p_fecha_prestamo DATE)
BEGIN
    DECLARE libro_prestado VARCHAR(10);
    DECLARE v_id_bibliotecario INT DEFAULT 1;
    DECLARE v_fecha_vencimiento DATE;

    SELECT estado 
    INTO libro_prestado
    FROM libro
    WHERE id_libro = p_id_libro;

    IF libro_prestado = 'prestado' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El libro ya está prestado';
    ELSE
		SET autocommit = 0;
        
        START TRANSACTION;
        SET v_fecha_vencimiento = DATE_ADD(p_fecha_prestamo, INTERVAL 30 DAY);
        
        INSERT INTO prestamo (id_usuario, id_libro, id_bibliotecario, fecha_prestamo, fecha_vencimiento, fecha_devolucion)
        VALUES (p_id_usuario, p_id_libro, v_id_bibliotecario, p_fecha_prestamo, v_fecha_vencimiento, NULL);

        UPDATE libro
        SET estado = 'prestado'
        WHERE id_libro = p_id_libro;
        
		INSERT INTO auditoriaPrestamo (id_prestamo, accion, fecha)
        VALUES (LAST_INSERT_ID(), 'Préstamo Creado', p_fecha_prestamo);
        
        COMMIT;

		SET autocommit = 1;

    END IF;
END //
DELIMITER ;

CALL registrar_prestamo(9, 3, '2024-06-01');

-- VISTA

CREATE VIEW vista_prestamos_actuales AS
SELECT p.id_prestamo, l.titulo AS nombre_libro, CONCAT(u.nombre, ' ', u.apellido) AS nombre_usuario, p.fecha_prestamo
FROM prestamo p
JOIN libro l ON p.id_libro = l.id_libro
JOIN usuario u ON p.id_usuario = u.id_usuario
WHERE p.fecha_devolucion IS NULL;

SELECT * FROM vista_prestamos_actuales;

-- TRIGGER

DELIMITER //

CREATE TRIGGER actualizar_fecha_devolucion 
BEFORE UPDATE ON prestamo
FOR EACH ROW 
BEGIN
    IF NEW.fecha_devolucion IS NOT NULL THEN
        SET NEW.fecha_devolucion = CURDATE();
    END IF;
END //

DELIMITER ;