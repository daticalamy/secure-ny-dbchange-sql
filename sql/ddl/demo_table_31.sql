--liquibase formatted sql

--changeset asmith:table31 labels:"WI 123987"
create table demo_table_31 (
	id int, 
	first_name varchar(50),
    last_name varchar(50),
	jobrole varchar(30)
); 
--rollback drop table demo_table_31