CREATE TABLE DIRECCION_CLIENTE(
ID NUMBER PRIMARY KEY NOT NULL,
CALLE NVARCHAR2(50) NOT NULL,
NUM_INT NUMBER NOT NULL,
NUM_EXT NUMBER NOT NULL,
CP NUMBER NOT NULL
);

CREATE SEQUENCE SEC_DIR
START WITH 1
INCREMENT BY 1;

CREATE TRIGGER TRI_DIR
BEFORE INSERT
ON DIRECCION_CLIENTE
FOR EACH ROW 
BEGIN
    SELECT SEC_DIR.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

CREATE TABLE CLIENTE(
ID NUMBER PRIMARY KEY NOT NULL,
NOMBRES NVARCHAR2(30) NOT NULL,
APP NVARCHAR2(20) NOT NULL,
APM NVARCHAR2(20) NOT NULL,
NUM_CEL NUMBER NOT NULL,
CORREO NVARCHAR2(50) NOT NULL,
DIR_ID NUMBER NOT NULL,
FOREIGN KEY(DIR_ID) REFERENCES DIRECCION_CLIENTE(ID) ON DELETE CASCADE
);

INSERT INTO DIRECCION_CLIENTE VALUES();