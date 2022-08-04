CREATE ROLE BoxOfficeClerk;
CREATE ROLE Driver;
CREATE ROLE HumanResources;
CREATE ROLE TransportManager;
CREATE ROLE TravelManager;
CREATE ROLE Accountant;
CREATE ROLE Master;

GRANT select ON THE_DEPARTMENT TO BoxOfficeClerk;
GRANT select ON THE_DEPARTMENT TO Driver;
GRANT select, insert, update, delete ON THE_DEPARTMENT TO TravelManager;

GRANT select ON MUNICIPALITY TO BoxOfficeClerk;
GRANT select ON MUNICIPALITY TO Driver;
GRANT select, insert, update, delete ON MUNICIPALITY TO TravelManager;

GRANT select ON TERMINAL TO BoxOfficeClerk;
GRANT select ON TERMINAL TO Driver;
GRANT select ON TERMINAL TO HumanResources;
GRANT select, insert, update, delete ON TERMINAL TO TravelManager;

GRANT select ON ARRIVAL_TERMINAL TO BoxOfficeClerk;
GRANT select ON ARRIVAL_TERMINAL TO Driver;
GRANT select, insert, update, delete ON ARRIVAL_TERMINAL TO TravelManager;

GRANT select ON DEPARTURE_TERMINAL TO BoxOfficeClerk;
GRANT select ON DEPARTURE_TERMINAL TO Driver;
GRANT select ON DEPARTURE_TERMINAL TO HumanResources;
GRANT select, insert, update, delete ON DEPARTURE_TERMINAL TO TravelManager;

GRANT select ON FUEL TO Driver;
GRANT select, insert, update, delete ON FUEL TO TransportManager;

GRANT select ON SERVICE TO BoxOfficeClerk;
GRANT select, insert, update, delete ON SERVICE TO TransportManager;

GRANT select ON BRAND_TRANSPORT TO Driver;
GRANT select, insert, update, delete ON BRAND_TRANSPORT TO TransportManager;

GRANT select ON TRANSPORT_TYPE TO BoxOfficeClerk;
GRANT select ON TRANSPORT_TYPE TO Driver;
GRANT select, insert, update, delete ON TRANSPORT_TYPE TO TransportManager;

GRANT select ON CATALOGUE_DETAIL TO BoxOfficeClerk;
GRANT select, insert, update, delete ON CATALOGUE_DETAIL TO TransportManager;

GRANT select ON DOCUMENT_TYPE TO BoxOfficeClerk;
GRANT select ON DOCUMENT_TYPE TO Driver;
GRANT select ON DOCUMENT_TYPE TO HumanResources;
GRANT select ON DOCUMENT_TYPE TO TransportManager;
GRANT select, insert, update, delete ON DOCUMENT_TYPE TO Master;

GRANT select ON EMPLOYEE_STATE TO HumanResources;

GRANT select, insert, update, delete ON TYPE_CONTRACT TO HumanResources;

GRANT select, insert, update, delete ON WORKSHIFT TO HumanResources;

GRANT select, insert, update, delete ON CONTRACT TO HumanResources;

GRANT select ON BOX_OFFICE TO BoxOfficeClerk;
GRANT select, insert, update, delete ON BOX_OFFICE TO HumanResources;

GRANT select ON THE_EMPLOYEE TO BoxOfficeClerk;
GRANT select ON THE_EMPLOYEE TO Driver;
GRANT select, insert, update, delete ON THE_EMPLOYEE TO HumanResources;
GRANT select ON THE_EMPLOYEE TO TransportManager;

GRANT select ON EMPLOYEE_BOX_OFFICE TO BoxOfficeClerk;
GRANT select, insert, update, delete ON EMPLOYEE_BOX_OFFICE TO HumanResources;

GRANT select ON EMPLOYEE_DRIVER TO Driver;
GRANT select, insert, update, delete ON EMPLOYEE_DRIVER TO HumanResources;
GRANT select ON EMPLOYEE_DRIVER TO TransportManager;

GRANT select ON TRANSPORT TO BoxOfficeClerk;
GRANT select ON TRANSPORT TO Driver;
GRANT select, insert, update, delete ON TRANSPORT TO TransportManager;
GRANT select ON TRANSPORT TO TravelManager;

GRANT select ON TRAVEL TO BoxOfficeClerk;
GRANT select ON TRAVEL TO Driver;
GRANT select, insert, update, delete ON TRAVEL TO TravelManager;

GRANT select, update, insert ON CLIENT TO BoxOfficeClerk;
GRANT select, insert, update, delete ON CLIENT TO Master;

GRANT select, insert ON SALE TO BoxOfficeClerk;
GRANT select ON SALE TO Accountant;
GRANT select, insert, update, delete ON SALE TO Master;

GRANT select ON INVENTORY_STATE TO BoxOfficeClerk;
GRANT select ON INVENTORY_STATE TO TravelManager;
GRANT select, insert, update, delete ON INVENTORY_STATE TO Master;

GRANT select ON INVENTORY TO BoxOfficeClerk;
GRANT select, insert, update, delete ON INVENTORY TO TravelManager;

GRANT select, insert ON TICKET TO BoxOfficeClerk;
GRANT select, insert, update, delete ON TICKET TO Master;

GRANT select ON STATE_TRANSPORT TO TransportManager;
GRANT select, insert, update, delete ON STATE_TRANSPORT TO Master;

GRANT select ON LOCATION_STATE TO TravelManager;
GRANT select, insert, update, delete ON LOCATION_STATE TO Master;

GRANT select, insert, update, delete ON BILL_TECNO TO Accountant;
GRANT select, insert, update, delete ON COMPANY TO Accountant;

GRANT select, insert, update, delete ON STATE TO Master;

GRANT select, insert, update, delete ON SALE_STATE TO Master;