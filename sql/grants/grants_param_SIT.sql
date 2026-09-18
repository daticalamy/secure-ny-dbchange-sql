--liquibase formatted sql

--changeset asmith:sit_grants labels:"WI 123456" context:sit endDelimiter:@
BEGIN
  DECLARE v_delete_stmt VARCHAR(200);
  DECLARE v_insert_stmt VARCHAR(200);
  DECLARE v_select_group_stmt VARCHAR(400); 
  DECLARE v_select_user_stmt VARCHAR(400); 
  DECLARE v_update_stmt VARCHAR(200);
 
  FOR v1 as
      c1 CURSOR FOR SELECT rtrim(ltrim(CREATOR)) CREATOR,NAME from SYSIBM.systables where CREATOR LIKE '%NYHBEODB%'
      DO
		set v_delete_stmt = 'GRANT DELETE ON TABLE '||CREATOR||'.'||NAME ||' to USER "CSAPP1","EEAPP1", "PMAPP1","SHAPP1"';
	    set v_insert_stmt = 'GRANT INSERT ON TABLE '||CREATOR||'.'||NAME ||' to USER "CSAPP1","EEAPP1", "PMAPP1","SHAPP1"';
	    set v_select_group_stmt = 'GRANT SELECT ON TABLE '||CREATOR||'.'||NAME ||' to GROUP "HXAAPPL", GROUP "HXAPPL", GROUP "HXETL", GROUP "HXFSTEW", GROUP "HXPRPT", GROUP "HXTEST", GROUP "HXUST1", GROUP "HXUTEST", GROUP "HXUTSTUP"'; 
	    set v_select_user_stmt = 'GRANT SELECT ON TABLE '||CREATOR||'.'||NAME ||' to USER "CSAPP1","EEAPP1","HXETL1","HXRPT1","PMAPP1","SHAPP1","SHTST1","SVC_DAST","SVC_DENC","SVC_DFMS","SVC_UAST"'; 
	    set v_update_stmt = 'GRANT UPDATE ON TABLE '||CREATOR||'.'||NAME ||' to USER "CSAPP1","EEAPP1", "PMAPP1","SHAPP1"';
        execute immediate v_delete_stmt;
        execute immediate v_insert_stmt;
        execute immediate v_select_group_stmt;
        execute immediate v_select_user_stmt;
        execute immediate v_update_stmt;
      END FOR;
END