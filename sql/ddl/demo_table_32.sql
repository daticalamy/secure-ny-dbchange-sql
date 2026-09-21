--liquibase formatted sql

--changeset asmith:table32 labels:"WI 111111"
create table demo_table_32 (
	id int, 
	first_name varchar(50),
    last_name varchar(50),
	jobrole varchar(30)
); 
--rollback drop table demo_table_32