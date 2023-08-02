-- Open this file in ACS's 'Run SQL Scripts'
-- Replace 'OXBLIB' with your test library
-- To run all statements at once, press Ctrl+Shift+A 

CL: CRTLIB LIB(OJASVA) TYPE(*PROD) TEXT('Work Lib for Ojasva') ;
SET SCHEMA OJASVA ;
CREATE TABLE QAUOOPT LIKE QGPL.QAUOOPT ;

-- Can also use the following statement
-- CREATE TABLE OXBLIB/QAUOOPT AS (SELECT * FROM QGPL/QAUOOPT) WITH NO DATA ;
-- If you want data in the new file, use the following statement
-- CREATE TABLE OXBLIB/QAUOOPT AS (SELECT * FROM QGPL/QAUOOPT) WITH DATA ;

INSERT INTO QAUOOPT VALUES(' C', 'CALL &O/&N') ;
INSERT INTO QAUOOPT VALUES(' Q', 'WRKMBRPDM FILE(OXBLIB/QTOOLSRC)') ;
INSERT INTO QAUOOPT VALUES(' W', 'WRKMBRPDM') ;
INSERT INTO QAUOOPT VALUES('AL', 'ADDLIBLE LIB(&L) POSITION(*FIRST)') ;
INSERT INTO QAUOOPT VALUES('BY', 'SIGNOFF LOG(*NOLIST) ENDCNN(*NO)') ;
INSERT INTO QAUOOPT VALUES('C1', 'CRTBNDCL PGM(&L/&N) SRCFILE(&L/&F) SRCMBR(&N) DBGVIEW(*SOURCE)') ;
INSERT INTO QAUOOPT VALUES('CC', 'CHGCURLIB CURLIB(&L)') ;
INSERT INTO QAUOOPT VALUES('CF', 'RUNSQLSTM SRCFILE(&L/&F) SRCMBR(&N) COMMIT(*NONE) DFTRDBCOL(&L)') ;
INSERT INTO QAUOOPT VALUES('CH', 'CHGPF FILE(&L/&N)') ;
INSERT INTO QAUOOPT VALUES('CL', 'CLRPFM FILE(&L/&N)') ;
INSERT INTO QAUOOPT VALUES('CM', 'CMPPFM NEWFILE(&L/&F) NEWMBR(&N) OLDFILE(&L/&F) OLDMBR(&N) CMPTYPE(*LINE)') ;
INSERT INTO QAUOOPT VALUES('CQ', 'CRTSQLRPGI OBJ(&L/&N) SRCFILE(&L/&F) SRCMBR(&N) COMMIT(*NONE) DBGVIEW(*SOURCE)') ;
INSERT INTO QAUOOPT VALUES('CS', 'CRTSRCPF FILE(&L/&F) RCDLEN(112)') ;
INSERT INTO QAUOOPT VALUES('CY', 'CPYSRCF FROMFILE(#IAEMG/&F) TOFILE(&L/&F) FROMMBR(&N) TOMBR(&N) MBROPT(*ADD)') ;
INSERT INTO QAUOOPT VALUES('DB', 'DSPDBR FILE(&L/&N)') ;
INSERT INTO QAUOOPT VALUES('DF', 'DSPFFD FILE(&L/&N)') ;
INSERT INTO QAUOOPT VALUES('DJ', 'DSPJOBLOG') ;
INSERT INTO QAUOOPT VALUES('DL', 'DSPLIBL') ;
INSERT INTO QAUOOPT VALUES('DM', 'DSPMODSRC') ;
INSERT INTO QAUOOPT VALUES('ED', 'ENDDBG') ;
INSERT INTO QAUOOPT VALUES('EL', 'EDTLIBL') ;
INSERT INTO QAUOOPT VALUES('ES', 'ENDSRVJOB') ;
INSERT INTO QAUOOPT VALUES('IP', 'WRKTCPSTS *IFC') ;
INSERT INTO QAUOOPT VALUES('JL', 'DSPJOBLOG') ;
INSERT INTO QAUOOPT VALUES('LN', 'WRKLNK /') ;
INSERT INTO QAUOOPT VALUES('MR', 'MRGSRC TGTFILE(&L/&F) TGTMBR(&N) MAINTFILE(&L/&F) MAINTMBR(&N) ROOTFILE(&L/&F) ROOTMBR(&N)') ;
INSERT INTO QAUOOPT VALUES('P0', 'CRTPGM PGM(&L/&N) MODULE(&L/&N)') ;
INSERT INTO QAUOOPT VALUES('P1', 'RUNSQLSTM SRCFILE(&L/&F) SRCMBR(&N) COMMIT(*NONE) NAMING(*SYS) DFTRDBCOL(&L) DBGVIEW(*SOURCE)') ;
INSERT INTO QAUOOPT VALUES('QT', 'DSPLIB LIB(QTEMP)') ;
INSERT INTO QAUOOPT VALUES('R1', 'CRTBNDRPG PGM(&L/&N) SRCFILE(&L/&F) SRCMBR(&N) DBGVIEW(*SOURCE)') ;
INSERT INTO QAUOOPT VALUES('RQ', 'RUNQRY QRYFILE((&L/&N *FIRST))') ;
INSERT INTO QAUOOPT VALUES('RS', 'RUNSQLSTM SRCFILE(&L/&F) SRCMBR(&M) COMMIT(*NONE)') ;
INSERT INTO QAUOOPT VALUES('S1', 'CRTSQLRPGI OBJ(&L/&N) SRCFILE(&L/&F) SRCMBR(&N) COMMIT(*NONE) OBJTYPE(*MODULE) DBGVIEW(*SOURCE)') ;
INSERT INTO QAUOOPT VALUES('SD', 'STRDBG PGM(&L/&N) UPDPROD(*YES) OPMSRC(*YES) DSPMODSRC(*YES)') ;
INSERT INTO QAUOOPT VALUES('SL', 'CALL PGM(OXBLIB/SETLIBLOXB)') ;
INSERT INTO QAUOOPT VALUES('SL', 'SBMJOB ??CMD(SAVLIB LIB(&N))') ;
INSERT INTO QAUOOPT VALUES('SM', 'SBMJOB ??CMD(SAVOBJ OBJ(&F) LIB(&L) OBJTYPE(*FILE) FILEMBR((&F (&N))))') ;
INSERT INTO QAUOOPT VALUES('SO', 'SBMJOB ??CMD(SAVOBJ OBJ(&N) LIB(&L))') ;
INSERT INTO QAUOOPT VALUES('SP', 'WRKSPLF') ;
INSERT INTO QAUOOPT VALUES('SQ', 'STRSQL') ;
INSERT INTO QAUOOPT VALUES('SS', 'STRSRVJOB') ;
INSERT INTO QAUOOPT VALUES('SV', 'STRDBG UPDPROD(*YES) OPMSRC(*YES) SRVPGM(&L/&N)') ;
INSERT INTO QAUOOPT VALUES('UP', 'UPDDTA FILE(&L/&N)') ;
INSERT INTO QAUOOPT VALUES('US', 'UPDSRVPGM SRVPGM(&L/&N) MODULE(&L/&N)') ;
INSERT INTO QAUOOPT VALUES('WA', 'WRKACTJOB SBS(QINTER)') ;
INSERT INTO QAUOOPT VALUES('WO', 'WRKOBJ &L/&N') ;
INSERT INTO QAUOOPT VALUES('WS', 'WRKSBMJOB') ;
INSERT INTO QAUOOPT VALUES('WU', 'WRKUSRJOB') ;
INSERT INTO QAUOOPT VALUES('Y9', 'SIGNOFF ENDCNN(*YES)') ;
INSERT INTO QAUOOPT VALUES('YC', 'CMPPFM NEWFILE(&L/&F) NEWMBR(&N) OLDFILE(#IAEMG/&F) OLDMBR(&N)') ;
INSERT INTO QAUOOPT VALUES('YC', 'CRTBNDCL PGM(&L/&N) SRCFILE(&L/&F) REPLACE(*YES) DBGVIEW(*LIST)') ;
INSERT INTO QAUOOPT VALUES('YD', 'DLTSPLF FILE(*SELECT)') ;
INSERT INTO QAUOOPT VALUES('YD', 'DLTSPLF FILE(*SELECT)') ;
INSERT INTO QAUOOPT VALUES('YM', 'MRGSRC TGTFILE(&L/&F) TGTMBR(&N) MAINTFILE(&L/&F) MAINTMBR(TEST) ROOTFILE(&L/&F) ROOTMBR(&N)') ;
INSERT INTO QAUOOPT VALUES('YR', 'CRTBNDRPG PGM(&L/&N) SRCFILE(&F) DBGVIEW(*SOURCE)') ;
INSERT INTO QAUOOPT VALUES('YS', 'CRTSQLRPGI OBJ(&L/&N) SRCFILE(&L/&F) DBGVIEW(*LIST)') ;

CL: CPYF FROMFILE(QGPL/QAUOOPT) TOFILE(OJASVA/QAUOOPT) MBROPT(*ADD) INCCHAR(*FLD 1 *EQ 'AI') ;
CL: CPYF FROMFILE(QGPL/QAUOOPT) TOFILE(OJASVA/QAUOOPT) MBROPT(*ADD) INCCHAR(*FLD 1 *EQ 'IA') ;
CL: CPYF FROMFILE(QGPL/QAUOOPT) TOFILE(OJASVA/QAUOOPT) MBROPT(*ADD) INCCHAR(*FLD 1 *EQ 'S1') ;
CL: CPYF FROMFILE(QGPL/QAUOOPT) TOFILE(OJASVA/QAUOOPT) MBROPT(*ADD) INCCHAR(*FLD 1 *EQ 'S2') ;
CL: CPYF FROMFILE(QGPL/QAUOOPT) TOFILE(OJASVA/QAUOOPT) MBROPT(*ADD) INCCHAR(*FLD 1 *EQ 'S3') ;
CL: CPYF FROMFILE(QGPL/QAUOOPT) TOFILE(OJASVA/QAUOOPT) MBROPT(*ADD) INCCHAR(*FLD 1 *EQ 'SV') ;

-- WRKMBRPDM shorthand
    -- create CL program
CL: CRTSRCPF FILE(OJASVA/QCLSRC) RCDLEN(112) TEXT('CL Source Members') ;
CL: ADDPFM FILE(OJASVA/QCLSRC) MBR(WMP) TEXT('WRKMBRPDM Shorthand') SRCTYPE(CLLE) ;
INSERT INTO OJASVA.QCLSRC VALUES(000010, 000000, 'wrkmbrpdm') ;
CL: CRTBNDCL PGM(QGPL/WMP) SRCFILE(OJASVA/QCLSRC) SRCMBR(WMP) DBGVIEW(*SOURCE) ;
    -- create CMD source
CL: CRTSRCPF FILE(OJASVA/QCMDSRC) RCDLEN(112) TEXT('Command Source Members') ;
CL: ADDPFM FILE(OJASVA/QCMDSRC) MBR(W) TEXT('WRKMBRPDM Shorthand') SRCTYPE(CMD) ;
INSERT INTO OJASVA.QCMDSRC VALUES(000010, 000000, 'cmd prompt(''WRKMBRPDM shorthand'')') ;
CL: CRTCMD CMD(QGPL/W) PGM(QGPL/WMP) SRCFILE(OJASVA/QCMDSRC) SRCMBR(W) ;
    -- delete the source members for CLLE and CMD
CL: RMVM FILE(OJASVA/QCLSRC) MBR(WMP);
CL: RMVM FILE(OJASVA/QCMDSRC) MBR(W);
    -- delete both spools
CL: DLTSPLF FILE(WMP) JOB(OJASVA/QPRTJOB) SPLNBR(*LAST) JOBSYSNAME(*ANY) CRTDATE(*LAST) ;
CL: DLTSPLF FILE(W) JOB(OJASVA/QPRTJOB) SPLNBR(*LAST) JOBSYSNAME(*ANY) CRTDATE(*LAST) ;

-- Other general PF-SRCs
CL: CRTSRCPF FILE(OJASVA/QRPGLESRC) RCDLEN(112) TEXT('RPGLE Source Members') ;
CL: CRTSRCPF FILE(OJASVA/QDDSSRC) RCDLEN(112) TEXT('DB Files - Data Description Specs') ;
-- RCDLEN for DDLs can go upto 32766 bytes, but to prevent EDT0303 keep it to 240
-- 240 req hi performance
-- or the alternative is to store SQL source members on IFS (6144 bytes)
-- On 5250 console (the green-screen) IFS can only show 2084 byte/record
-- On a 27x132 screen size, you can view 132 bytes/record at once
-- i.e. you'd need to press F20/F19 15-16 times to goto End-Of-Record/Beginning-Of-Record (EOR/BOR)
CL: CRTSRCPF FILE(OJASVA/QDDLSRC) RCDLEN(240) TEXT('DB Files - Data Definition Language') ;
CL: CRTSRCPF FILE(OJASVA/QSQLSRC) RCDLEN(240) TEXT('RUNSQLSTM Source Members') ;

-- RUNSQLSTM accepts STMF path upto 50 chars ('/qsys.lib/L123456789.lib/F123456789.file/M1234.mbr')

-- Require for VS Code cfg
CL: MKDIR DIR('/home/OJASVA') ;
    -- *SECADM required to create or change user profiles.
CL: CHGUSRPRF USRPRF(OJASVA) HOMEDIR('/home/OJASVA') ;
stop ;
-- Manual Activities to do in PDM
-- Press Ctrl+Home to get the screen ruler
-- WRKMBRPDM FILE(OJASVA/QRPGLESRC)
-- Press Shift+F6 (F18=Change Defaults) and update the librray for 'Option file' from QGPL to OJASVA
-- I personally prefer 'Compile in batch' and 'Change type and text' set to 'N'

-- Manual Activities to do to setup keyboard (*.kmp file)
-- Reassign the key from 'Delete Character' to 'Erase to End of Field'
-- IBM i ACS > Edit > Keyboard > Category = 'Host Functions' > Erase to End of Field > Assign a Key > *press Delete* > Yes
-- Save and find the user files (.kmp, .hod, .ini) at C:\Users\xxx\Documents\IBM\iAccessClient\Emulator
