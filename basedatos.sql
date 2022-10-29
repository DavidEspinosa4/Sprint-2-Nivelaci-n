CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
USE mydb ;

-- -----------------------------------------------------
-- Table mydb.Administrador
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Administrador (
  idAdministrador INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Telefono VARCHAR(45) NOT NULL,
  Direccion VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAdministrador))
  ;


-- -----------------------------------------------------
-- Table mydb.Vendedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Vendedores (
  idVendedores INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Telefono VARCHAR(45) NOT NULL,
  Direccion VARCHAR(45) NOT NULL,
  Administrador_idAdministrador INT NOT NULL,
  PRIMARY KEY (idVendedores, Administrador_idAdministrador),
  CONSTRAINT fk_Vendedores_Administrador1
    FOREIGN KEY (Administrador_idAdministrador)
    REFERENCES mydb.Administrador (idAdministrador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table mydb.Proveedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Proveedores (
  idProveedores INT NOT NULL,
  Empresa VARCHAR(45) NOT NULL,
  Nombre VARCHAR(45) NULL,
  Telefono VARCHAR(45) NULL,
  Direccion VARCHAR(45) NULL,
  Administrador_idAdministrador INT NOT NULL,
  PRIMARY KEY (idProveedores, Administrador_idAdministrador),
  CONSTRAINT fk_Proveedores_Administrador1
    FOREIGN KEY (Administrador_idAdministrador)
    REFERENCES mydb.Administrador (idAdministrador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table mydb.Clientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Clientes (
  idClientes INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Telefono VARCHAR(45) NOT NULL,
  Direccion VARCHAR(45) NOT NULL,
  Administrador_idAdministrador INT NOT NULL,
  PRIMARY KEY (idClientes, Administrador_idAdministrador),
  CONSTRAINT fk_Clientes_Administrador1
    FOREIGN KEY (Administrador_idAdministrador)
    REFERENCES mydb.Administrador (idAdministrador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table mydb.Productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Productos (
  idProductos INT NOT NULL,
  Valor VARCHAR(45) NOT NULL,
  Unidades VARCHAR(45) NOT NULL,
  Marca VARCHAR(45) NOT NULL,
  Cantidad VARCHAR(45) NOT NULL,
  Proveedores_idProveedores INT NOT NULL,
  Administrador_idAdministrador INT NOT NULL,
  PRIMARY KEY (idProductos, Administrador_idAdministrador),
    CONSTRAINT fk_Productos_Proveedores
    FOREIGN KEY (Proveedores_idProveedores)
    REFERENCES mydb.Proveedores (idProveedores)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Productos_Administrador1
    FOREIGN KEY (Administrador_idAdministrador)
    REFERENCES mydb.Administrador (idAdministrador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table mydb.Productos_has_Clientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Productos_has_Clientes (
  Productos_idProductos INT NOT NULL,
  Clientes_idClientes INT NOT NULL,
  PRIMARY KEY (Productos_idProductos, Clientes_idClientes),
  CONSTRAINT fk_Productos_has_Clientes_Productos1
    FOREIGN KEY (Productos_idProductos)
    REFERENCES mydb.Productos (idProductos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Productos_has_Clientes_Clientes1
    FOREIGN KEY (Clientes_idClientes)
    REFERENCES mydb.Clientes (idClientes)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table mydb.Productos_has_Clientes1
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Productos_has_Clientes1 (
  Productos_idProductos INT NOT NULL,
  Clientes_idClientes INT NOT NULL,
  PRIMARY KEY (Productos_idProductos, Clientes_idClientes),
  CONSTRAINT fk_Productos_has_Clientes1_Productos1
    FOREIGN KEY (Productos_idProductos)
    REFERENCES mydb.Productos (idProductos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Productos_has_Clientes1_Clientes1
    FOREIGN KEY (Clientes_idClientes)
    REFERENCES mydb.Clientes (idClientes)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;