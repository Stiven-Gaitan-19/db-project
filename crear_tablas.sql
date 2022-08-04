CREATE TABLE LOCATION_STATE (
	ID NUMBER(2),
	NAME VARCHAR2(15) NOT NULL,
	CONSTRAINT location_state_name_uk UNIQUE (NAME),
	CONSTRAINT location_state_id_pk PRIMARY KEY(ID)
);

CREATE TABLE THE_DEPARTMENT (
	ID NUMBER(2),
	NAME VARCHAR2(30) NOT NULL,
	LOC_STATE_ID NUMBER(2) NOT NULL,
	CONSTRAINT the_department_name_uk UNIQUE (NAME),
	CONSTRAINT the_department_id_pk PRIMARY KEY(ID),
	CONSTRAINT the_department_loc_state_id_fk FOREIGN KEY (LOC_STATE_ID) REFERENCES LOCATION_STATE (ID)
);

CREATE TABLE MUNICIPALITY(
	ID NUMBER(4),
	NAME VARCHAR2(40) NOT NULL,
	LOC_STATE_ID NUMBER(2) NOT NULL,
	DEPARTMENT_ID NUMBER(2) NOT NULL,
	CONSTRAINT municipality_name_uk UNIQUE (NAME),
	CONSTRAINT municipality_id_pk PRIMARY KEY(ID),
	CONSTRAINT municipality_loc_state_id_fk FOREIGN KEY (LOC_STATE_ID) REFERENCES LOCATION_STATE (ID),
    	CONSTRAINT municipality_department_id_fk FOREIGN KEY (DEPARTMENT_ID) REFERENCES THE_DEPARTMENT (ID)
);

CREATE TABLE TERMINAL(
	ID NUMBER(4),
	NAME VARCHAR2(30) NOT NULL,
	ADDRESS VARCHAR2(50) NOT NULL,
	NUM_TEL VARCHAR2(10) NOT NULL,
	MUNICIPAL_ID NUMBER(4) NOT NULL,
	CONSTRAINT terminal_id_pk PRIMARY KEY(ID),
	CONSTRAINT terminal_municipal_id_fk FOREIGN KEY (MUNICIPAL_ID) REFERENCES MUNICIPALITY (ID)
);

CREATE TABLE ARRIVAL_TERMINAL(
	ID NUMBER(4),
	TERM_ID NUMBER(4) NOT NULL,
	CONSTRAINT arrival_terminal_id_pk PRIMARY KEY(ID),
	CONSTRAINT arrival_terminal_term_id_fk FOREIGN KEY (TERM_ID) REFERENCES TERMINAL (ID),
	CONSTRAINT arrival_term_id_uk UNIQUE (TERM_ID)
);

CREATE TABLE DEPARTURE_TERMINAL(
	ID NUMBER(4),
	TERM_ID NUMBER(4) NOT NULL,
	CONSTRAINT departure_terminal_id_pk PRIMARY KEY(ID),
	CONSTRAINT departure_terminal_term_id_fk FOREIGN KEY (TERM_ID) REFERENCES TERMINAL (ID),
	CONSTRAINT departure_term_id_uk UNIQUE (TERM_ID)
);

CREATE TABLE STATE(
	ID NUMBER(2),
	NAME VARCHAR2(15) NOT NULL,
	CONSTRAINT state_name_uk UNIQUE (NAME),
	CONSTRAINT state_id_pk PRIMARY KEY(ID)
);

CREATE TABLE FUEL(
	ID NUMBER(2),
	NAME VARCHAR2(15) NOT NULL,
	STATE_ID NUMBER(2) NOT NULL,
	CONSTRAINT fuel_name_uk UNIQUE (NAME),
	CONSTRAINT fuel_id_pk PRIMARY KEY(ID),
	CONSTRAINT fuel_state_id_fk FOREIGN KEY (STATE_ID) REFERENCES STATE (ID)
);

CREATE TABLE SERVICE(
	ID NUMBER(2),
	NAME VARCHAR2(20) NOT NULL,
	STATE_ID NUMBER(2) NOT NULL,
	CONSTRAINT service_name_uk UNIQUE (NAME),
	CONSTRAINT service_id_pk PRIMARY KEY(ID),
	CONSTRAINT service_state_id_fk FOREIGN KEY (STATE_ID) REFERENCES STATE (ID)
);

CREATE TABLE STATE_TRANSPORT(
	ID NUMBER(2),
	NAME VARCHAR2(15) NOT NULL,
	CONSTRAINT state_transport_name_uk UNIQUE (NAME),
	CONSTRAINT state_transport_id_pk PRIMARY KEY(ID)
);

CREATE TABLE BRAND_TRANSPORT(
	ID NUMBER(3),
	NAME VARCHAR2(15) NOT NULL,
	CONSTRAINT brand_transport_name_uk UNIQUE (NAME),
	CONSTRAINT brand_transport_id_pk PRIMARY KEY(ID)
);

CREATE TABLE TRANSPORT_TYPE(
	ID NUMBER(2),
	NAME VARCHAR2(30) NOT NULL,
	DESCRIPCION VARCHAR2(100),
	STATE_ID NUMBER(2) NOT NULL,
	CONSTRAINT transport_type_uk UNIQUE (NAME),
	CONSTRAINT transport_type_id_pk PRIMARY KEY(ID),
	CONSTRAINT transport_type_state_id_fk FOREIGN KEY (STATE_ID) REFERENCES STATE (ID)
);

CREATE TABLE CATALOGUE_DETAIL(
	TRANS_TYPE_ID NUMBER(2),
	SERVICE_ID NUMBER(2),
	CONSTRAINT catalog_detail_pk PRIMARY KEY(TRANS_TYPE_ID, SERVICE_ID),
	CONSTRAINT catalog_detail_trans_type_id_fk FOREIGN KEY (TRANS_TYPE_ID) REFERENCES TRANSPORT_TYPE (ID),
	CONSTRAINT catalog_detail_service_id_fk FOREIGN KEY (SERVICE_ID) REFERENCES SERVICE (ID)
);

CREATE TABLE COMPANY (
	NIT NUMBER (9),
	NAME VARCHAR2 (20) NOT NULL,
	ADDRESS VARCHAR2 (30) NOT NULL,
	CONSTRAINT company_id_pk PRIMARY KEY (NIT)
);

CREATE TABLE DOCUMENT_TYPE (
	ID NUMBER (3),
	NAME VARCHAR2 (20) NOT NULL,
	DESCRIPTION VARCHAR2 (20) NOT NULL,
	STATE_ID NUMBER (3) NOT NULL,
	CONSTRAINT document_type_name_uk UNIQUE (NAME),
	CONSTRAINT document_type_id_pk PRIMARY KEY (ID),
	CONSTRAINT document_type_state_id_fk FOREIGN KEY (STATE_ID)
	REFERENCES STATE (ID)
);

CREATE TABLE EMPLOYEE_STATE (
	ID NUMBER (3),
	NAME VARCHAR2 (20) NOT NULL,
	CONSTRAINT employee_state_name_uk UNIQUE (NAME),
	CONSTRAINT employee_state_id_pk PRIMARY KEY (ID)
);

CREATE TABLE TYPE_CONTRACT (
	ID NUMBER (4),
	NAME VARCHAR2 (20) NOT NULL,
	CONSTRAINT type_contract_name_uk UNIQUE (NAME),
	CONSTRAINT type_contract_id_pk PRIMARY KEY (ID)
);

CREATE TABLE WORKSHIFT (
	ID NUMBER (3),
	NAME VARCHAR2 (20) NOT NULL,
	TIME_START DATE NOT NULL,
	TIME_FINISH DATE NOT NULL,
	CONSTRAINT workshift_name_uk UNIQUE (NAME),
	CONSTRAINT workshift_id_pk PRIMARY KEY (ID)
);

CREATE TABLE CONTRACT (
	ID NUMBER (3),
	VALIDATY_DATE DATE NOT NULL,
	START_DATE DATE NOT NULL,
	TYPE_CONTRACT_ID NUMBER(4) NOT NULL,
	CONSTRAINT contract_id_pk PRIMARY KEY (ID),
	CONSTRAINT contract_type_contract_id_fk FOREIGN KEY (TYPE_CONTRACT_ID) 
	REFERENCES TYPE_CONTRACT (ID)
);

CREATE TABLE BOX_OFFICE (
	ID NUMBER (3),
	LOCATION VARCHAR2 (20) NOT NULL,
	DEPARTURE_TERMINAL_ID NUMBER (3) NOT NULL,
	CONSTRAINT boxoffice_id_pk PRIMARY KEY (ID),
	CONSTRAINT boxoffice_departure_terminal_id_fk FOREIGN KEY (DEPARTURE_TERMINAL_ID)
	REFERENCES DEPARTURE_TERMINAL (ID)
);

CREATE TABLE THE_EMPLOYEE (
	ID NUMBER (3),
	DOCUMENT NUMBER (10) NOT NULL,
	NAME VARCHAR2 (20) NOT NULL,
	LASTNAME VARCHAR2 (20) NOT NULL,
	PHONE NUMBER (10) NOT NULL,
	DATE_BORN DATE NOT NULL,
	EMPLOYEE_STATE_ID NUMBER (3) NOT NULL,
	DOCUMENT_TYPE_ID NUMBER (3) NOT NULL,
	CONTRACT_ID NUMBER (3) NOT NULL,
	CONSTRAINT employee_document_uk UNIQUE (DOCUMENT),
	CONSTRAINT the_employee_id_pk PRIMARY KEY (ID),
	CONSTRAINT employee_employee_state_id_fk FOREIGN KEY (EMPLOYEE_STATE_ID)
	REFERENCES EMPLOYEE_STATE (ID),
	CONSTRAINT employee_document_type_id_fk FOREIGN KEY (DOCUMENT_TYPE_ID)
	REFERENCES DOCUMENT_TYPE (ID),
	CONSTRAINT employee_contract_id_fk FOREIGN KEY(CONTRACT_ID)
	REFERENCES CONTRACT (ID),
	CONSTRAINT employee_contract_id_uk UNIQUE (CONTRACT_ID)
);

CREATE TABLE EMPLOYEE_BOX_OFFICE (
	ID NUMBER (3),
	BOX_OFFICE_ID NUMBER (3) NOT NULL,
	EMPLOYEE_ID NUMBER (3) NOT NULL,
	WORKSHIFT_ID NUMBER (3) NOT NULL,
	CONSTRAINT employee_boxoffice_id_pk PRIMARY KEY (ID),
	CONSTRAINT employee_boxoffice_boxoffice_id_fk FOREIGN KEY (BOX_OFFICE_ID)
	REFERENCES BOX_OFFICE (ID),
	CONSTRAINT employee_boxoffice_employee_id_fk FOREIGN KEY (EMPLOYEE_ID)	
	REFERENCES THE_EMPLOYEE (ID),
	CONSTRAINT employee_boxoffice_employee_id_uk UNIQUE (EMPLOYEE_ID),
	CONSTRAINT employee_boxoffice_workshift_id_fk FOREIGN KEY (WORKSHIFT_ID)
	REFERENCES WORKSHIFT (ID)
);

CREATE TABLE EMPLOYEE_DRIVER (
	ID NUMBER (3),
	EMPLOYEE_ID NUMBER (3) NOT NULL,
	CONSTRAINT employee_driver_id_pk PRIMARY KEY (ID),
	CONSTRAINT employee_driver_employee_id_fk FOREIGN KEY (EMPLOYEE_ID)
	REFERENCES THE_EMPLOYEE (ID),
	CONSTRAINT employee_driver_employee_id_uk UNIQUE (EMPLOYEE_ID)
);

CREATE TABLE TRANSPORT(
	LICENSE_PLATE VARCHAR2(6),
	MODEL VARCHAR2(20) NOT NULL,
	YEAR VARCHAR2(4) NOT NULL,
	TRANS_TYPE_ID NUMBER(2) NOT NULL,
	FUEL_ID NUMBER(2) NOT NULL,
	STATE_TRANS_ID NUMBER(2) NOT NULL,
	BRAND_TRANS_ID NUMBER(3) NOT NULL,
	EMP_DRIVER_ID NUMBER(3) NOT NULL,
	CONSTRAINT transport_license_plate_pk PRIMARY KEY(LICENSE_PLATE),
	CONSTRAINT transport_trans_type_id_fk FOREIGN KEY (TRANS_TYPE_ID) REFERENCES TRANSPORT_TYPE (ID),
	CONSTRAINT transport_fuel_id_fk FOREIGN KEY (FUEL_ID) REFERENCES FUEL (ID),
	CONSTRAINT transport_state_trans_id_fk FOREIGN KEY (STATE_TRANS_ID) REFERENCES STATE_TRANSPORT (ID),
	CONSTRAINT transport_brand_trans_id_fk FOREIGN KEY (BRAND_TRANS_ID) REFERENCES BRAND_TRANSPORT (ID),
	CONSTRAINT transport_emp_driver_id_fk FOREIGN KEY (EMP_DRIVER_ID) REFERENCES EMPLOYEE_DRIVER (ID)
);

CREATE TABLE BILL_TECNO(
	ID NUMBER (6),
	CODE VARCHAR2(20),
	PRICE NUMBER(9) NOT NULL,
	DESCRIPTION VARCHAR2(300) NOT NULL,
	FIX_DATE DATE NOT NULL,
	LICENSE_PLATE VARCHAR2(6) NOT NULL,
	COMPANY NUMBER (9) NOT NULL,
	CONSTRAINT bill_tecno_id_pk PRIMARY KEY(ID),
	CONSTRAINT bill_tecno_license_plate_fk FOREIGN KEY (LICENSE_PLATE) REFERENCES TRANSPORT (LICENSE_PLATE),
	CONSTRAINT bill_tecno_company_nit_fk FOREIGN KEY (COMPANY) REFERENCES COMPANY (NIT)
);

CREATE TABLE TRAVEL(
	ID NUMBER(10),
	DEPARTURE_DATE DATE NOT NULL,
	ARRIVAL_DATE DATE NOT NULL,
	PRICE NUMBER(6) NOT NULL,
	ARR_TERM_ID NUMBER(4) NOT NULL,
	DEPART_TERM_ID NUMBER(4) NOT NULL,
	LICENSE_PLATE VARCHAR2(6) NOT NULL,
	CONSTRAINT travel_id_pk PRIMARY KEY(ID),
	CONSTRAINT travel_arr_term_id_fk FOREIGN KEY (ARR_TERM_ID) REFERENCES ARRIVAL_TERMINAL (ID),
	CONSTRAINT travel_depart_term_id_fk FOREIGN KEY (DEPART_TERM_ID) REFERENCES DEPARTURE_TERMINAL (ID),
	CONSTRAINT travel_license_plate_fk FOREIGN KEY (LICENSE_PLATE) REFERENCES TRANSPORT (LICENSE_PLATE)
);

CREATE TABLE SALE_STATE (
	ID NUMBER (3),
	NAME VARCHAR2(20) NOT NULL,
	CONSTRAINT sale_state_name_uk UNIQUE (NAME),
	CONSTRAINT sale_state_id_pk PRIMARY KEY (ID)
);

CREATE TABLE CLIENT (
	ID NUMBER (3),
	DOCUMENT NUMBER (10) NOT NULL,
	NAME_USER VARCHAR2(20) NOT NULL,
	LAST_USER VARCHAR (20) NOT NULL,
	PHONE_USER NUMBER (10) NOT NULL,
	DATE_BORN DATE NOT NULL,
	DOCUMENT_TYPE_ID NUMBER (3) NOT NULL,
	CONSTRAINT client_document_uk UNIQUE (DOCUMENT),
	CONSTRAINT client_id_pk PRIMARY KEY (ID),
	CONSTRAINT client_document_type_id_fk FOREIGN KEY (DOCUMENT_TYPE_ID)
	REFERENCES DOCUMENT_TYPE (ID)
);

CREATE TABLE SALE (
	ID NUMBER (3),
	DATE_SALE DATE NOT NULL,
	TOTAL_PRICE NUMBER (20) NOT NULL,
	CLIENT_ID NUMBER (3) NOT NULL,
	SALE_STATE_ID NUMBER (3) NOT NULL,
	EMPLOYEE_BOXOFFICE_ID NUMBER (3) NOT NULL,
	CONSTRAINT SALE_ID_PK PRIMARY KEY (ID),
	CONSTRAINT sale_client_id_fk FOREIGN KEY (CLIENT_ID)
	REFERENCES CLIENT (ID),
	CONSTRAINT sale_sale_state_id_fk FOREIGN KEY (SALE_STATE_ID)
	REFERENCES SALE_STATE (ID),
	CONSTRAINT sale_employee_boxoffice_id_fk FOREIGN KEY (EMPLOYEE_BOXOFFICE_ID)
	REFERENCES EMPLOYEE_BOX_OFFICE (ID)
);

CREATE TABLE INVENTORY_STATE (
	ID NUMBER (3),
	NAME VARCHAR2 (20) NOT NULL,
	CONSTRAINT inventory_state_name_uk UNIQUE (NAME),
	CONSTRAINT inventory_state_id_pk PRIMARY KEY (ID)
);

CREATE TABLE INVENTORY (
	ID NUMBER (3),
	INVENTORY_STATE_ID NUMBER (3) NOT NULL,
	LICENSE_PLATE VARCHAR2 (6) NOT NULL,
	CONSTRAINT inventory_id_pk PRIMARY KEY (ID),
	CONSTRAINT inventory_inventory_state_id_fk FOREIGN KEY (INVENTORY_STATE_ID)
	REFERENCES INVENTORY_STATE (ID),
	CONSTRAINT inventory_license_plate_fk FOREIGN KEY (LICENSE_PLATE)
	REFERENCES TRANSPORT (LICENSE_PLATE)
);

CREATE TABLE TICKET (
	ID NUMBER (3),
	SALE_ID NUMBER (3) NOT NULL,
	INVENTORY_ID NUMBER (3) NOT NULL,
	CONSTRAINT ticket_id_pk PRIMARY KEY (ID),
	CONSTRAINT ticket_sale_id_fk FOREIGN KEY (SALE_ID)
	REFERENCES SALE (ID),
	CONSTRAINT ticket_inventory_id_fk FOREIGN KEY (INVENTORY_ID)
	REFERENCES INVENTORY (ID)
);
