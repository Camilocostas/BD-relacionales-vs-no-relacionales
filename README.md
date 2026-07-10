<div align="center">

# Procedimientos Almacenados — Parte 1

![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)

</div>

## 📋 Descripción

Ejercicio educativo (SENA) sobre procedimientos almacenados en MySQL, usando como caso de estudio la gestión de una tabla de empleados. Parte 1 de un proyecto por etapas.

## 🎯 Objetivos del ejercicio

- Diseño de tabla relacional con restricciones (`PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `DEFAULT`)
- Creación de procedimientos almacenados con y sin parámetros
- Consultas con filtros, ordenamiento y parámetros de entrada (`IN`)

## 🗄️ Estructura de la base de datos

**Base de datos:** `empresa`

```sql
CREATE TABLE empleados (
    id_empleado         INT PRIMARY KEY AUTO_INCREMENT,
    nombre               VARCHAR(100) NOT NULL,
    apellido             VARCHAR(100) NOT NULL,
    email                VARCHAR(150) UNIQUE,
    salario              DECIMAL(10,2),
    fecha_contratacion   DATE,
    departamento         VARCHAR(100),
    activo               BOOLEAN DEFAULT TRUE
);
```

## 📁 Archivos del repositorio

| Archivo | Contenido |
|---|---|
| `BD.sql` | Creación de la base de datos y tabla `empleados` |
| `Llenado.sql` | Inserción de 5 empleados de prueba (Ventas, Marketing, TI) |
| `Consulta salarios.sql` | Procedimiento `mostrar_salario_empleados(IN salarioMayor DECIMAL)` |
| `Consulta todos los empleados.sql` | Procedimiento `mostrar_empleados()` — lista empleados activos |
| `consulta empleados area TI.sql` | Procedimiento `mostrar_empleados_ti()` — filtra por departamento TI |
| `consultas basicas.sql` | Consulta simple `SELECT * FROM empleados` |
| `TALLER.rar` | Archivo comprimido con ejercicios/documentación adicional |

## 🔧 Procedimientos almacenados

### `mostrar_salario_empleados(IN salarioMayor DECIMAL)`
Retorna los empleados con salario mayor o igual al parámetro dado.
```sql
CALL mostrar_salario_empleados(8000000);
```

### `mostrar_empleados()`
Lista todos los empleados activos, ordenados por apellido y nombre.
```sql
CALL mostrar_empleados();
```

### `mostrar_empleados_ti()`
Muestra los empleados activos del departamento TI, ordenados por apellido y nombre.
```sql
CALL mostrar_empleados_ti();
```

## ▶️ Cómo ejecutar

```bash
# 1. Crear la base de datos y tabla
mysql -u root -p < BD.sql

# 2. Insertar datos de prueba
mysql -u root -p empresa < Llenado.sql

# 3. Cargar y ejecutar los procedimientos almacenados
mysql -u root -p empresa < "Consulta todos los empleados.sql"
mysql -u root -p empresa < "consulta empleados area TI.sql"
mysql -u root -p empresa < "Consulta salarios.sql"
```

## 🐛 Nota conocida

En `Consulta salarios.sql` hay una referencia a una columna que no existe en la tabla (`empleado`, en vez de `nombre`/`apellido`). Corrección sugerida:

```sql
-- En vez de:
SELECT empleado, salario

-- Debería ser:
SELECT CONCAT(nombre, ' ', apellido) AS empleado, salario
```

## 📄 Licencia

Este repositorio no tiene licencia definida actualmente.
