use furno;

-- super admin, can do everything
CREATE USER 'superAdmin'@'localhost' IDENTIFIED BY 'superAdminPassword123!';

-- static privileges
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE,  DROP ROLE ON *.* TO `superAdmin`@`localhost` WITH GRANT OPTION;


-- dynamic privileges
GRANT APPLICATION_PASSWORD_ADMIN,AUDIT_ABORT_EXEMPT,AUDIT_ADMIN,AUTHENTICATION_POLICY_ADMIN,BACKUP_ADMIN,BINLOG_ADMIN,BINLOG_ENCRYPTION_ADMIN,CLONE_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,FLUSH_OPTIMIZER_COSTS,FLUSH_STATUS,FLUSH_TABLES,FLUSH_USER_RESOURCES,GROUP_REPLICATION_ADMIN,INNODB_REDO_LOG_ARCHIVE,INNODB_REDO_LOG_ENABLE,PASSWORDLESS_USER_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_APPLIER,REPLICATION_SLAVE_ADMIN, RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SERVICE_CONNECTION_ADMIN,SESSION_VARIABLES_ADMIN,SET_USER_ID,SHOW_ROUTINE,SYSTEM_USER, SYSTEM_VARIABLES_ADMIN,TABLE_ENCRYPTION_ADMIN,XA_RECOVER_ADMIN ON *.* TO `superAdmin`@`localhost` WITH GRANT OPTION;

-- needed to enable an external user to connect as and have the privileges of another user
GRANT PROXY ON ``@`` TO `superAdmin`@`localhost` WITH GRANT OPTION;

-- sellerSideAdmin
-- maintains the databases concerning the seller
CREATE USER 'sellerSideAdmin'@'localhost' IDENTIFIED BY 'sellerSideAdminPassword123!';

grant SELECT, INSERT, UPDATE, DELETE, CREATE on seller to 'sellerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on sellerResidesIn to 'sellerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on orders to 'sellerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on containsProduct to 'sellerSideAdmin'@'localhost';



-- buyerSideAdmin
-- maintains the databases concerning the buyer
CREATE USER 'buyerSideAdmin'@'localhost' IDENTIFIED BY 'buyerSideAdminPassword123!';

grant SELECT, INSERT, UPDATE, DELETE, CREATE on buyer to 'buyerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on buyerResidesIn to 'buyerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on orders to 'buyerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on containsProduct to 'buyerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on putsIntoCart to 'buyerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on reviews to 'buyerSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on paymentCards to 'buyerSideAdmin'@'localhost';


-- productSideAdmin
-- maintains the databases concerning the product
CREATE USER 'productSideAdmin'@'localhost' IDENTIFIED BY 'productSideAdminPassword123!';

grant SELECT, INSERT, UPDATE, DELETE, CREATE on product to 'productSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on orders to 'productSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on containsProduct to 'productSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on promoCode to 'productSideAdmin'@'localhost';
grant SELECT, INSERT, UPDATE, DELETE, CREATE on reviews to 'productSideAdmin'@'localhost';


-- web developer for product page
create user 'productPageDeveloper'@'localhost' IDENTIFIED BY 'productPageDeveloperPassword123!';
grant select on productBrowsing to 'productPageDeveloper'@'localhost';
grant select on promoCode to 'productPageDeveloper'@'localhost';
grant select on reviews to 'productPageDeveloper'@'localhost';


-- web developer for buyer profile page
create user 'buyerProfileDeveloper'@'localhost' identified by 'buyerProfileDeveloperPassword123!';
grant select on buyerProfile to 'buyerProfileDeveloper'@'localhost';
grant select on orderDetails to 'buyerProfileDeveloper'@'localhost';
grant select on cart to 'buyerProfileDeveloper'@'localhost';
grant select on buyerResidesIn to 'buyerProfileDeveloper'@'localhost';


-- web developer for seller profile page
create user 'sellerProfileDeveloper'@'localhost' identified by 'sellerProfileDeveloperPassword123!';
grant select on sellerProfile to 'sellerProfileDeveloper'@'localhost';
grant select on product to 'sellerProfileDeveloper'@'localhost';
grant select on sellerResidesIn to 'sellerProfileDeveloper'@'localhost';
