CREATE OR REPLACE TABLE TESTFILE(
 PRIMARY_KEY
                FOR COLUMN CO#        CHAR(3) NOT NULL DEFAULT ' ',
 X_NUMBER
                FOR COLUMN RO#        CHAR(9) NOT NULL DEFAULT ' ',
 ACTIVITY_TIME
                FOR COLUMN TIMSTMP    TIMESTAMP NOT NULL WITH DEFAULT,
 ACTIVITY_DESCRIPTION
                FOR COLUMN NAME       CHAR(50) CCSID 37 NOT NULL DEFAULT ' ',
 SEND_TO_FTP
                FOR COLUMN SFTP       VARCHAR(50) ALLOCATE(20) NOT NULL DEFAULT ' ',
 NUMBER_OF_ITERIONS
                FOR COLUMN COUNT      DECIMAL(3,0) NOT NULL DEFAULT 0)
  RCDFMT TESTFILEA;

ALTER TABLE TESTFILE ADD CONSTRAINT PK_TESTFILE PRIMARY KEY
  (CO#, RO#, TIMSTMP);

LABEL ON TABLE TESTFILE IS 'Test File Using SQL Source';

LABEL ON TABLE TESTFILE TEXT IS 'Test File Using SQL Source';

LABEL ON COLUMN TESTFILE (
  CO#     IS 'Corporation Number' ,
  RO#     IS 'X Number' ,
  TIMSTMP IS 'Timestamp',
  NAME    IS 'Activity Description' ,
  SFTP    IS 'Send To FTP Info',
  COUNT   IS 'Number of Iterions');

LABEL ON COLUMN TESTFILE (
  CO#     TEXT IS 'Corporation Number',
  RO#     TEXT IS 'X Number',
  TIMSTMP TEXT IS 'Timestamp',
  NAME    TEXT IS 'Activity Description',
  SDA     TEXT IS 'Send To FTP Info',
  COUNT   TEXT IS 'Number of Iterions');

-- Use foolowing cfg of RUNSQLSTM to create it's object.

--	If NAMING = *SYS and PF TESTFILE is in lib TESTPF (PF's library is used).
--	   PF gets picked from the provided details and gets created in TESTPF.
--    The system naming convention (library-name/file-name) is used.
--	ElseIf NAMING = *SQL (CURUSR's library is used).
--	   PF TESTFILE should exist in lib of the *CURUSR (i.e. BHARDWOX) to be created in BHARDWOX.
--    The SQL naming convention (schema-name.table-name) is used.
-- EndIf
