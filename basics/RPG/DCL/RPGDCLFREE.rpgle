     **FREE
      //*char
        dcl-s $Alpha1 char(10) ;
        dcl-s $Alpha2 like($Alpha1) inz(*all'*') ;
        dcl-s char_dsply char(52) inz('You know what, This is a fifty two char long string.');                                                                                  
        dsply char_dsply;                                                                                                                                                           
        //*unsigned numeral
        dcl-s $Packed1 packed(7) ;
        dcl-s $Packed2 packed(5:2) ;
        //*signed numeral
        dcl-s $Signed1 zoned(7:2) ;
        //*integer, unsigned integer, and float numeric variables
        dcl-s $Int1 int(3) ;
        dcl-s $Uns1 uns(3) ;
        dcl-s $Float1 float(8) ;
        //*date, time, timestamp
        dcl-s $Date1 date(*iso) ;
        dcl-s $Time1 time ;
        dcl-s $TimeStamp1 timestamp ;
        //*indicator variable (*on/*off)
        dcl-s $Ind1 ind ;
        //*boolean variable (true/false) - supported only in OpenRPG
        dcl-s mybool boolean;                                                               
        //*binary variable
        dcl-s $Bin1 bindec(5) ;
        //*pointer variable
        dcl-s $Pointer1 pointer inz(%addr($Alpha1));
        //*DTAARA variable
        dcl-s $TestDa1 char(10) dtaara('TESTDA') ;
        //*Constant (without keyword CONST)
        dcl-c SUCCESS '00000';
        dcl-c SINGLE_RECORD_EXISTS 1;
        //*Constant (hexadecimal)
        dcl-c CRLF const(x'0d25');
        dcl-c markUp const(.5);

        //figurative constants
        *BLANK/*BLANKS
        *ZERO/*ZEROS
        *HIVAL
        *LOVAL
        *ON
        *OFF
        *ALLX'x1..'
        *ALLG'oK1K2i'
        *ALL'X..'
        *NULL
        *START and *END - for positioning DB files

        //*PLIST - no need to supplu pgm name; no need to declare the parmx1 outside the PI; Dcl-Pr is optional
        Dcl-Pi *n ;               
          parmx1 VarChar(100) ; 
        End-Pi ;
        
        //*arrays
        //*run-time array
        dcl-s $RT_array char(3) dim(100) ;
        //*compile-time array (or tables)
        dcl-s TabTable1 char(7) dim(3) ctdata ;
        dcl-s $CT_array char(40) dim(%elem(TabTable1)) perrcd(1) ctdata;
        _______________________________________________
        .
        .
        .
        **ctdata $CT_array   
        1234567890123456789012345678901234567890
        A1        ELEM1   Test Element 1
        A2        ELEM2   Test Element 2
        _______________________________________________
        //*pre-runtime array
        _______________________________________________FlatFile with only field, FLAT1 as char(5) and holding 5 values in it
        FLAT1
        AAAAA
        BBBBB
        CCCCC
        DDDDD
        EEEEE
        _______________________________________________
        dcl-f FlatFile Usage(*Input);
        dcl-s $PR_array char(5) dim(5) fromfile(FlatFile) perrcd(1);
        _______________________________________________PF_with_2_fields, FLD1 packed(5:0), FLD2 packed(5:0) both holding 5 values
          FLD1     FLD2
        10,001   20,001
        10,002   20,002
        10,003   20,003
        10,004   20,004
        10,005   20,005
        ********  End of data  ********
        _______________________________________________
        dcl-F PF_with_2_fields Usage(*Input);
        dcl-S $PR_array packed(5:0) dim(10) fromfile(PF_with_2_fields) perrcd(2) extfmt(P);
        [extfmt(P) -> to indicate that the data for the array or table is in packed decimal format, and hence avoid decimal-data error. 
        The EXTFMT keyword is used to specify the external data type for compile-time and prerun-time numeric arrays and tables. 
        The external data type is the format of the data in the records in the file. 
        This entry has no effect on the format used for internal processing (internal data type) of the array or table in the program.
        ref: https://www.ibm.com/docs/api/v1/content/ssw_ibm_i_74/rzasd/dextfmt.htm]
        
        //*data-struct
        //*program described DS - unqualified
        dcl-ds  data_ds;                                      
           lib   char(10)      inz;                         
           key   char(20)      inz('&DUMMY_KEY'); 
           appl  char(2)       inz('LN');                   
           seq#  packed(5)     inz;                         
           flag  char(20)      inz('Y');                                        
        end-ds; 
        lib = 'USERLIB001';
        //*program described DS - qualified (i.e. other DS can use same subfield name; subfields when used have to prefix DS name with a dot(.))
        dcl-ds serial_num qualified dim(99);
          seq packed(9:0);  
        end-ds;
        dcl-ds folio_num qualified dim(99);
          seq packed(9:0);  
        end-ds;
        serial_num.seq = 8085;
        folio_num.seq = 8086;
        //*program described DS - template - can only act as a reference (when used with likeDS keyword) - 
        used to inherit any DS definition to another data structure to define it (using LikeDS keyword)
        dcl-pr writeFile char(1);
             *n likeds(ds_pref_t);  
        end-pr;
        dcl-ds ds_pref_t qualified template;                                       
           lib   char(10)      inz;                         
           key   char(20)      inz('&DUMMY_KEY'); 
           appl  char(2)       inz('LN');                   
           seq#  packed(5)     inz;                         
           flag  char(20)      inz('Y');                                          
        end-ds;                                                                   
        dcl-proc writeFile;                           
          dcl-pi *n  char(01);                           
            inds_pref likeds(ds_pref_t);                 
          end-pi;                                        
          dcl-ds ds_pref likeds(ds_pref_t) inz(*likeds);
          ds_pref1 = inds_pref;
        .
        .
        end-proc;                   
        //*program described DS - to break a field into subfields
        dcl-ds curtimstp;
           curtimdate     zoned(8:0) pos(1);
           curryear       zoned(4:0) pos(1);
           currmonth      zoned(2:0) pos(5);
           currday        zoned(2:0) pos(7);
           currhrs        zoned(2:0) pos(9);
           currmins       zoned(2:0) pos(11);
           currsecs       zoned(4:0) pos(13);
        end-ds;
        //*program described DS - to group multiple sub-fields into a field
        dcl-ds date;
           yy             char(4);
           filler1        char(1)    inz('-');
           mm             char(2);
           filler2        char(1)    inz('-');
           dd             char(2);
        end-ds;
        yy=%char(2012);
        mm=%char(10);
        dd=%char(15);
        dsply date;
        
        //*externally described DS - data structure is referenced from an external file definition
        dcl-ds pfile_ds extname('USERLIB001/PFILE') qualified dim(3) end-ds;
        pfile_ds.FLD1 = 10011;
        or
        dcl-ds pfile_ds ext qualified inz extname('PFILE') dim(10); end-ds;
        pfile_ds(1).FLD1 = 10011;
        or
        dcl-ds pfile_ds extname('USERLIB001/PFILE') prefix(DS_) dim(3) end-ds; 
        DS_FLD1 = 10011;
        or
        dcl-ds ds1  extname(PFILE);
           r_FLD1                   extfld(FLD1);
           s_FLD2                   extfld(FLD2);
        end-ds;
        r_FLD1 = 10011;
        s_FLD2 = 99999;
        
        //*data area DS (Specified In 'U')
        dcl-ds lda dtaara(*lda) qualified;  
          lda_data char(1024)  pos(1);       
          seq      packed(5:0) pos(1);           
          library  char(10)    pos(1018);     
        end-ds;
        or
        dcl-ds dads1  dtaara('dta1');
           fld1           char(4)    pos(1);
           fld2           char(2)    pos(6);
           fld3           char(6)    pos(9);
           fld4           char(4)    pos(16);
           fld5           char(10)   pos(21);
        end-ds;
        
        //*indicator DS
        //programme status DS (Specified In 'S')
        dcl-ds pgm_stat psds qualified;    
           program      *proc;             
           lineNumber   char(8)    pos(21);
        end-ds;
        or
        dcl-ds *n psds;                   
           program_lib  char(10)   pos(81);  
           job_name     char(10)   pos(244);    
           job_user     char(10)   pos(254);    
           job_number   zoned(6:0) pos(264);
           program_name char(10)   pos(334);
        end-ds;
        
        **free                                                     
        Dcl-DS MYPSDS  PSDS;                   //* Program Status DS - Complete                    
           PROC_NAME      *proc;               //* Procedure name   
           PGM_STATUS     *status;             //* Status code      
           PRV_STATUS     Zoned(5:0) Pos(16);  //* Previous status  
           LINE_NUM       Char(8)    Pos(21);  //* Src list line num
           ROUTINE        *routine;            //* Routine name     
           PARMS          *parms;              //* Num passed parmsx
           EXCP_TYPE      Char(3)    Pos(40);  //* Exception type   
           EXCP_NUM       Char(4)    Pos(43);  //* Exception number 
           PGM_LIB        Char(10)   Pos(81);  //* Program library  
           EXCP_DATA      Char(80)   Pos(91);  //* Exception data   
           EXCP_ID        Char(4)    Pos(171); //* Exception Id    
           DATE           Char(8)    Pos(191); //* Date (*DATE fmt)
           YEAR           Zoned(2:0) Pos(199); //* Year (*YEAR fmt)
           LAST_FILE      Char(8)    Pos(201); //* Last file used  
           FILE_INFO      Char(35)   Pos(209); //* File error info 
           JOB_NAME       Char(10)   Pos(244); //* Job name        
           USER           Char(10)   Pos(254); //* User name       
           JOB_NUM        Zoned(6:0) Pos(264); //* Job number        
           JOB_DATE       Zoned(6:0) Pos(270); //* Date (UDATE fmt)  
           RUN_DATE       Zoned(6:0) Pos(276); //* Run date (UDATE)  
           RUN_TIME       Zoned(6:0) Pos(282); //* Run time (UDATE)  
           CRT_DATE       Char(6)    Pos(288); //* Create date       
           CRT_TIME       Char(6)    Pos(294); //* Create time       
           CPL_LEVEL      Char(4)    Pos(300); //* Compiler level    
           SRC_FILE       Char(10)   Pos(304); //* Source file       
           SRC_LIB        Char(10)   Pos(314); //* Source file lib   
           SRC_MBR        Char(10)   Pos(324); //* Source file mbr   
           PROC_PGM       Char(10)   Pos(334); //* Pgm Proc is in    
           PROC_MOD       Char(10)   Pos(344); //* Mod Proc is in    
           P21_28         Bindec(2)  Pos(354); //* pos 21-28 srcID   
           P228_235       Bindec(2)  Pos(356); //* pos 228-235       
           CURUSR         Char(10)   Pos(358); //* CURUSR            
           XERRCDE        Zoned(4:0) Pos(368); //* external ERRCDE   
           ELEM_XML       Zoned(8:0) Pos(372); //* XML-INTO DATA-INTO
           INTJOBID       Char(16)   Pos(380); //* internal JOBID    
           SYSNAME        Char(8)    Pos(396); //* SYSNAM            
           UNUSED_26CHAR  Char(26)   Pos(404); //* Unused
        End-DS;                                          
        *inlr = *on;                        
        
        **free                                                     
        Dcl-DS MYPSDS  PSDS;                   //* Program Status DS - Complete                    
           PROC_NAME      Char(10)   Pos(1);   //* Procedure name    
           PGM_STATUS     Zoned(5:0) Pos(11);  //* Status code     
           PRV_STATUS     Zoned(5:0) Pos(16);  //* Previous status  
           LINE_NUM       Char(8)    Pos(21);  //* Src list line num
           ROUTINE        Char(8)    Pos(29);  //* Routine name    
           PARMS          Zoned(3:0) Pos(37);  //* Num passed parms 
           EXCP_TYPE      Char(3)    Pos(40);  //* Exception type   
           EXCP_NUM       Char(4)    Pos(43);  //* Exception number 
           PGM_LIB        Char(10)   Pos(81);  //* Program library  
           EXCP_DATA      Char(80)   Pos(91);  //* Exception data   
           EXCP_ID        Char(4)    Pos(171); //* Exception Id    
           DATE           Char(8)    Pos(191); //* Date (*DATE fmt)
           YEAR           Zoned(2:0) Pos(199); //* Year (*YEAR fmt)
           LAST_FILE      Char(8)    Pos(201); //* Last file used  
           FILE_INFO      Char(35)   Pos(209); //* File error info 
           JOB_NAME       Char(10)   Pos(244); //* Job name        
           USER           Char(10)   Pos(254); //* User name       
           JOB_NUM        Zoned(6:0) Pos(264); //* Job number        
           JOB_DATE       Zoned(6:0) Pos(270); //* Date (UDATE fmt)  
           RUN_DATE       Zoned(6:0) Pos(276); //* Run date (UDATE)  
           RUN_TIME       Zoned(6:0) Pos(282); //* Run time (UDATE)  
           CRT_DATE       Char(6)    Pos(288); //* Create date       
           CRT_TIME       Char(6)    Pos(294); //* Create time       
           CPL_LEVEL      Char(4)    Pos(300); //* Compiler level    
           SRC_FILE       Char(10)   Pos(304); //* Source file       
           SRC_LIB        Char(10)   Pos(314); //* Source file lib   
           SRC_MBR        Char(10)   Pos(324); //* Source file mbr   
           PROC_PGM       Char(10)   Pos(334); //* Pgm Proc is in    
           PROC_MOD       Char(10)   Pos(344); //* Mod Proc is in    
           P21_28         Bindec(2)  Pos(354); //* pos 21-28 srcID   
           P228_235       Bindec(2)  Pos(356); //* pos 228-235       
           CURUSR         Char(10)   Pos(358); //* CURUSR            
           XERRCDE        Zoned(4:0) Pos(368); //* external ERRCDE   
           ELEM_XML       Zoned(8:0) Pos(372); //* XML-INTO DATA-INTO
           INTJOBID       Char(16)   Pos(380); //* internal JOBID    
           SYSNAME        Char(8)    Pos(396); //* SYSNAM            
           UNUSED_26CHAR  Char(26)   Pos(404); //* Unused
        End-DS;                                          
        *inlr = *on;                                     
        
        //*file information DS
        dcl-f pfile usage(*update) keyed usropn infds(user_infds);  
        dcl-ds user_infds qualified;           
          file          *file;              
          lineNumber    char(8)    pos(30); 
          library       char(10)   pos(93); 
        end-ds;
        //*multiple occurence DS
        dcl-ds ds1  occurs(10);
           fld01        char(5)    pos(1);
           fld02        char(5)    pos(6);
        end-ds;
        
        dcl-ds Fdbck;
           Fdbck_Fil char(80)
           Fdbck_Opn char(160)
           Fdbck_IO char(126)
           Fdbck_Dev varchar(326)
           Fdbck_Dev varchar(443)
        end-ds


         DCL-F MYFILE DISK(*EXT) INFDS(FILEFBK);
      
         DCL-DS FILEFBK;
           FILE          *FILE;                  // File name
           OPEN_IND      IND        POS(9);      // File open?
           EOF_IND       IND        POS(10:      // File at eof?
           STATUS        *STATUS;                // Status code
           OPCODE        *OPCODE;                // Last opcode
           ROUTINE       *ROUTINE;               // RPG Routine
           LIST_NUM      CHAR(8)    POS(30);     // Listing line
           SPCL_STAT     ZONED(5)   POS(38);     // SPECIAL status
           RECORD        *RECORD;                // Record name
           MSGID         CHAR(7)    POS(46);     // Error MSGID
           SCREEN        *SIZE;                  // Screen size
           NLS_IN        *INP;                   // NLS Input?
           NLS_OUT       *OUT;                   // NLS Output?
           NLS_MODE      *MODE;                  // NLS Mode?
         END-DS;
      
         DCL-F MYFILE PRINTER(132) INFDS(OPNFBK);
      
         DCL-DS OPNFBK;
           ODP_TYPE      CHAR(2)    POS(81);     // ODP Type
           FILE_NAME     CHAR(10)   POS(83);     // File name
           LIBRARY       CHAR(10)   POS(93);     // Library name
           SPOOL_FILE    CHAR(10)   POS(103);    // Spool file name
           SPOOL_LIB     CHAR(10)   POS(113);    // Spool file lib
           SPOOL_NUM_OLD INT(5)     POS(123);    // Spool file num
           RCD_LEN       INT(5)     POS(125);    // Max record len
           KEY_LEN       INT(5)     POS(127);    // Max key len
           MEMBER        CHAR(10)   POS(129);    // Member name
           TYPE          INT(5)     POS(147);    // File type
           ROWS          INT(5)     POS(152);    // Num PRT/DSP rows
           COLUMNS       INT(5)     POS(154);    // Num PRT/DSP cols
           NUM_RCDS      INT(10)    POS(156);    // Num of records
           SPOOL_NUM     INT(10)    POS(160);    // 6 digit Spool Nbr
           ACC_TYPE      CHAR(2)    POS(160);    // Access type
           DUP_KEY       CHAR(1)    POS(162);    // Duplicate key?
           SRC_FILE      CHAR(1)    POS(163);    // Source file?
           VOL_OFF       INT(5)     POS(184);    // Vol label offset
           BLK_RCDS      INT(5)     POS(186);    // Max rcds in blk
           OVERFLOW      INT(5)     POS(188);    // Overflow line
           BLK_INCR      INT(5)     POS(190);    // Blk increment
           FLAGS1        CHAR(1)    POS(196);    // Misc flags
           REQUESTER     CHAR(10)   POS(197);    // Requester name
           OPEN_COUNT    INT(5)     POS(207);    // Open count
           BASED_MBRS    INT(5)     POS(211);    // Num based mbrs
           FLAGS2        CHAR(1)    POS(213);    // Misc flags
           OPEN_ID       CHAR(2)    POS(214);    // Open identifier
           RCDFMT_LEN    INT(5)     POS(216);    // Max rcd fmt len
           CCSID         INT(5)     POS(218);    // Database CCSID
           FLAGS3        CHAR(1)    POS(220);    // Misc flags
           NUM_DEVS      INT(5)     POS(227);    // Num devs defined
         END-DS;
      
      
         DCL-F MYFILE WORKSTN INFDS(MYIOFBK);
      
         DCL-DS MYIOFBK;
                                                 // 241-242 not used
           WRITE_CNT     UNS(10)    POS(243);    // Write count
           READ_CNT      UNS(10)    POS(247);    // Read count
           WRTRD_CNT     UNS(10)    POS(251);    // Write/read count
           OTHER_CNT     INT(10)    POS(255);    // Other I/O count
           OPERATION     CHAR(1)    POS(260);    // Current operation
           IO_RCD_FMT    CHAR(10)   POS(261);    // Rcd format name
           DEV_CLASS     CHAR(2)    POS(271);    // Device class
           IO_PGM_DEV    CHAR(10)   POS(273);    // Pgm device name
           IO_RCD_LEN    INT(10)    POS(283);    // Rcd len of I/O
         END-DS;
         
      
      
         DCL-F MYFILE WORKSTN INFDS(DSPATRFBK);
      
         DCL-DS DSPATRFBK;
           PGM_DEV       CHAR(10)   POS(241);    // Program device
           DEV_DSC       CHAR(10)   POS(251);    // Dev description
           USER_ID       CHAR(10)   POS(261);    // User ID
           DEV_CLASS     CHAR(1)    POS(271);    // Device class
           DEV_TYPE      CHAR(6)    POS(272);    // Device type
           REQ_DEV       CHAR(1)    POS(278);    // Requester?
           ACQ_STAT      CHAR(1)    POS(279);    // Acquire status
           INV_STAT      CHAR(1)    POS(280);    // Invite status
           DATA_AVAIL    CHAR(1)    POS(281);    // Data available
           NUM_ROWS      INT(5)     POS(282);    // Number of rows
           NUM_COLS      INT(5)     POS(284);    // Number of cols
           BLINK         CHAR(1)    POS(286);    // Allow blink?
           LINE_STAT     CHAR(1)    POS(287);    // Online/offline?
           DSP_LOC       CHAR(1)    POS(288);    // Display location
           DSP_TYPE      CHAR(1)    POS(289);    // Display type
           KBD_TYPE      CHAR(1)    POS(290);    // Keyboard type
           CTL_INFO      CHAR(1)    POS(342);    // Controller info
           COLOR_DSP     CHAR(1)    POS(343);    // Color capable?
           GRID_DSP      CHAR(1)    POS(344);    // Grid line dsp?
           // The following fields apply to ISDN.
           ISDN_LEN      INT(5)     POS(385);    // Rmt number len
           ISDN_TYPE     CHAR(2)    POS(387);    // Rmt number type
           ISDN_PLAN     CHAR(2)    POS(389);    // Rmt number plan
           ISDN_NUM      CHAR(40)   POS(391);    // Rmt number
           ISDN_SLEN     INT(5)     POS(435);    // Rmt sub-address length
           ISDN_STYPE    CHAR(2)    POS(437);    // Rmt sub-address type
           ISDN_SNUM     CHAR(40)   POS(439);    // Rmt sub-address
           ISDN_CON      CHAR(1)    POS(480);    // Connection
           ISDN_RLEN     INT(5)     POS(481);    // Rmt address len
           ISDN_RNUM     CHAR(32)   POS(483);    // Rmt address
           ISDN_ELEN     INT(5)     POS(519);    // Extension len
           ISDN_ETYPE    CHAR(1)    POS(521);    // Extension type
           ISDN_ENUM     CHAR(40)   POS(522);    // Extension num
           ISDN_XTYPE    CHAR(1)    POS(566);    // X.25 call type
         END-DS;
         
         
         DCL-F MYFILE WORKSTN INFDS(ICFATRFBK);
      
         DCL-DS ICFATRFBK;
           PGM_DEV       CHAR(10)   POS(241);    // Program device
           DEV_DSC       CHAR(10)   POS(251);    // Dev description
           USER_ID       CHAR(10)   POS(261);    // User ID
           DEV_CLASS     CHAR(1)    POS(271);    // Device class
           DEV_TYPE      CHAR(1)    POS(272);    // Device type
           REQ_DEV       CHAR(1)    POS(278);    // Requester?
           ACQ_STAT      CHAR(1)    POS(279);    // Acquire status
           INV_STAT      CHAR(1)    POS(280);    // Invite status
           DATA_AVAIL    CHAR(1)    POS(281);    // Data available
           SES_STAT      CHAR(1)    POS(291);    // Session status
           SYNC_LVL      CHAR(1)    POS(292);    // Synch level
           CONV_TYPE     CHAR(1)    POS(293);    // Conversation typ
           RMT_LOC       CHAR(10)   POS(294);    // Remote location
           LCL_LU        CHAR(8)    POS(302);    // Local LU name
           LCL_NETID     CHAR(8)    POS(310);    // Local net ID
           RMT_LU        CHAR(8)    POS(318);    // Remote LU
           RMT_NETID     CHAR(8)    POS(326);    // Remote net ID
           APPC_MODE     CHAR(8)    POS(334);    // APPC Mode
           LU6_STATE     CHAR(1)    POS(345);    // LU6 conv state
           LU6_COR       CHAR(8)    POS(346);    // LU6 conv correlator
           // The following fields apply to ISDN.
           ISDN_LEN      INT(5)     POS(385);    // Rmt number len
           ISDN_TYPE     CHAR(2)    POS(387);    // Rmt number type
           ISDN_PLAN     CHAR(2)    POS(389);    // Rmt number plan
           ISDN_NUM      CHAR(40)   POS(391);    // Rmt number
           ISDN_SLEN     INT(5)     POS(435);    // sub-addr len
           ISDN_STYPE    CHAR(2)    POS(437);    // sub-addr type
           ISDN_SNUM     CHAR(40)   POS(439);    // Rmt sub-address
           ISDN_CON      CHAR(1)    POS(480);    // Connection
           ISDN_RLEN     INT(5)     POS(481);    // Rmt address len
           ISDN_RNUM     CHAR(32)   POS(483);    // Rmt address
           ISDN_ELEN     CHAR(2)    POS(519);    // Extension len
           ISDN_ETYPE    CHAR(1)    POS(521);    // Extension type
           ISDN_ENUM     CHAR(40)   POS(522);    // Extension num
           ISDN_XTYPE    CHAR(1)    POS(566);    // X.25 call type
           // The following information is available only when program was started
 as result of a received program start request. (P_ stands for protected)
           TRAN_PGM      CHAR(64)   POS(567);    // Trans pgm name
           P_LUWIDLN     CHAR(1)    POS(631);    // LUWID fld len
           P_LUNAMELN    CHAR(1)    POS(632);    // LU-NAME len
           P_LUNAME      CHAR(17)   POS(633);    // LU-NAME
           P_LUWIDIN     CHAR(6)    POS(650);    // LUWID instance
           P_LUWIDSEQ    INT(5)     POS(656);    // LUWID seq num
           // The following information is available only when a protected conversation
           // is started on a remote system.  (U_ stands for unprotected)
           U_LUWIDLN     CHAR(1)    POS(658);    // LUWID fld len
           U_LUNAMELN    CHAR(1)    POS(659);    // LU-NAME len
           U_LUNAME      CHAR(17)   POS(660);    // LU-NAME
           U_LUWIDIN     CHAR(6)    POS(677);    // LUWID instance
           U_LUWIDSEQ    INT(5)     POS(683);    // LUWID seq num
         END-DS;
      
      complete file-information ds (infds)
         DCL-F MYFILE PRINTER(132) INFDS(INFDS0);
         
         DCL-DS INFDS0;                          // char(80) - File Feedback (length is 80)
           FILE          *FILE;                  // File name
           OPEN_IND      IND        POS(9);      // File open?
           EOF_IND       IND        POS(10:      // File at eof?
           STATUS        *STATUS;                // Status code
           OPCODE        *OPCODE;                // Last opcode
           ROUTINE       *ROUTINE;               // RPG Routine
           LIST_NUM      CHAR(8)    POS(30);     // Listing line
           SPCL_STAT     ZONED(5)   POS(38);     // SPECIAL status
           RECORD        *RECORD;                // Record name
           MSGID         CHAR(7)    POS(46);     // Error MSGID
           SCREEN        *SIZE;                  // Screen size
           NLS_IN        *INP;                   // NLS Input?
           NLS_OUT       *OUT;                   // NLS Output?
           NLS_MODE      *MODE;                  // NLS Mode?
         END-DS;
         DCL-DS INFDS0;                          // char(160) - Open Feedback (length is 160)
           ODP_TYPE      CHAR(2)    POS(81);     // ODP Type
           FILE_NAME     CHAR(10)   POS(83);     // File name
           LIBRARY       CHAR(10)   POS(93);     // Library name
           SPOOL_FILE    CHAR(10)   POS(103);    // Spool file name
           SPOOL_LIB     CHAR(10)   POS(113);    // Spool file lib
           SPOOL_NUM_OLD INT(5)     POS(123);    // Spool file num
           RCD_LEN       INT(5)     POS(125);    // Max record len
           KEY_LEN       INT(5)     POS(127);    // Max key len
           MEMBER        CHAR(10)   POS(129);    // Member name
           TYPE          INT(5)     POS(147);    // File type
           ROWS          INT(5)     POS(152);    // Num PRT/DSP rows
           COLUMNS       INT(5)     POS(154);    // Num PRT/DSP cols
           NUM_RCDS      INT(10)    POS(156);    // Num of records
           SPOOL_NUM     INT(10)    POS(160);    // 6 digit Spool Nbr
           ACC_TYPE      CHAR(2)    POS(160);    // Access type
           DUP_KEY       CHAR(1)    POS(162);    // Duplicate key?
           SRC_FILE      CHAR(1)    POS(163);    // Source file?
           VOL_OFF       INT(5)     POS(184);    // Vol label offset
           BLK_RCDS      INT(5)     POS(186);    // Max rcds in blk
           OVERFLOW      INT(5)     POS(188);    // Overflow line
           BLK_INCR      INT(5)     POS(190);    // Blk increment
           FLAGS1        CHAR(1)    POS(196);    // Misc flags
           REQUESTER     CHAR(10)   POS(197);    // Requester name
           OPEN_COUNT    INT(5)     POS(207);    // Open count
           BASED_MBRS    INT(5)     POS(211);    // Num based mbrs
           FLAGS2        CHAR(1)    POS(213);    // Misc flags
           OPEN_ID       CHAR(2)    POS(214);    // Open identifier
           RCDFMT_LEN    INT(5)     POS(216);    // Max rcd fmt len
           CCSID         INT(5)     POS(218);    // Database CCSID
           FLAGS3        CHAR(1)    POS(220);    // Misc flags
           NUM_DEVS      INT(5)     POS(227);    // Num devs defined
         END-DS;
         DCL-DS MYIOFBK;                         // char(126) - Input/Output Feedback (length is 126)
                                                 // 241-242 not used
           WRITE_CNT     UNS(10)    POS(243);    // Write count
           READ_CNT      UNS(10)    POS(247);    // Read count
           WRTRD_CNT     UNS(10)    POS(251);    // Write/read count
           OTHER_CNT     INT(10)    POS(255);    // Other I/O count
           OPERATION     CHAR(1)    POS(260);    // Current operation
           IO_RCD_FMT    CHAR(10)   POS(261);    // Rcd format name
           DEV_CLASS     CHAR(2)    POS(271);    // Device class
           IO_PGM_DEV    CHAR(10)   POS(273);    // Pgm device name
           IO_RCD_LEN    INT(10)    POS(283);    // Rcd len of I/O
         END-DS;
      ---------------------------------------------------------------------
         DCL-F MYFILE PRINTER(132) INFDS(PRTFBK);
      
         DCL-DS PRTFBK;
           CUR_LINE      INT(5)     POS(367);    // Current line num
           CUR_PAGE      INT(10)    POS(369);    // Current page cnt
           // If the first bit of PRT_FLAGS is on, the spooled file has been
           // deleted.  Use TESTB X'80' or TESTB '0' to test this bit.
           PRT_FLAGS     CHAR(1)    POS(373);    // Print Flags
           PRT_MAJOR     CHAR(2)    POS(401);    // Major ret code
           PRT_MINOR     CHAR(2)    POS(403);    // Minor ret code
         END-DS;
      
         DCL-F MYFILE DISK(*EXT) INFDS(DBFBK);
      
         DCL-DS DBFBK;
           FDBK_SIZE     INT(10)    POS(367);    // Current line num
           JOIN_BITS     INT(10)    POS(371);    // JFILE bits
           LOCK_RCDS     INT(5)     POS(377);    // Nbr locked rcds
           POS_BITS      CHAR(1)    POS(385);    // File pos bits
           DLT_BITS      CHAR(1)    POS(384);    // Rcd deleted bits
           NUM_KEYS      INT(5)     POS(387);    // Num keys (bin)
           KEY_LEN       INT(5)     POS(393);    // Key length
           MBR_NUM       INT(5)     POS(395);    // Member number
           DB_RRN        INT(10)    POS(397);    // Relative-rcd-num
           KEY           CHAR(2000) POS(401);    // Key value (max size 2000)
         END-DS;
         DCL-F MYFILE WORKSTN(*EXT) INFDS(ICFFBK);
      
         DCL-DS ICFFBK;
           ICF_AID       CHAR(1)    POS(369);    // AID byte
           ICF_LEN       INT(10)    POS(372);    // Actual data len
           ICF_MAJOR     CHAR(2)    POS(401);    // Major ret code
           ICF_MINOR     CHAR(2)    POS(403);    // Minor ret code
           SNA_SENSE     CHAR(8)    POS(405);    // SNA sense rc
           SAFE_IND      CHAR(1)    POS(413);    // Safe indicator
           RQSWRT        CHAR(1)    POS(415);    // Request write
           RMT_FMT       CHAR(10)   POS(416);    // Remote rcd fmt
           ICF_MODE      CHAR(8)    POS(430);    // Mode name
         END-DS;
         DCL-F MYFILE WORKSTN(*EXT) INFDS(DSPFBK);
      
         DCL-DS DSPFBK;
           DSP_FLAG1     CHAR(2)    POS(367);    // Display flags
           DSP_AID       CHAR(1)    POS(369);    // AID byte
           CURSOR        CHAR(2)    POS(370);    // Cursor location
           DATA_LEN      INT(10)    POS(372);    // Actual data len
           SF_RRN        INT(5)     POS(376);    // Subfile rrn
           MIN_RRN       INT(5)     POS(378);    // Subfile min rrn
           NUM_RCDS      INT(5)     POS(380);    // Subfile num rcds
           ACT_CURS      CHAR(2)    POS(382);    // Active window cursor location
           DSP_MAJOR     CHAR(2)    POS(401);    // Major ret code
           DSP_MINOR     CHAR(2)    POS(403);    // Minor ret code
         END-DS;
      --------------------------------------------------------------------
      
         DCL-F MYFILE WORKSTN INFDS(DSPATRFBK);
      
         DCL-DS DSPATRFBK;
           PGM_DEV       CHAR(10)   POS(241);    // Program device
           DEV_DSC       CHAR(10)   POS(251);    // Dev description
           USER_ID       CHAR(10)   POS(261);    // User ID
           DEV_CLASS     CHAR(1)    POS(271);    // Device class
           DEV_TYPE      CHAR(6)    POS(272);    // Device type
           REQ_DEV       CHAR(1)    POS(278);    // Requester?
           ACQ_STAT      CHAR(1)    POS(279);    // Acquire status
           INV_STAT      CHAR(1)    POS(280);    // Invite status
           DATA_AVAIL    CHAR(1)    POS(281);    // Data available
           NUM_ROWS      INT(5)     POS(282);    // Number of rows
           NUM_COLS      INT(5)     POS(284);    // Number of cols
           BLINK         CHAR(1)    POS(286);    // Allow blink?
           LINE_STAT     CHAR(1)    POS(287);    // Online/offline?
           DSP_LOC       CHAR(1)    POS(288);    // Display location
           DSP_TYPE      CHAR(1)    POS(289);    // Display type
           KBD_TYPE      CHAR(1)    POS(290);    // Keyboard type
           CTL_INFO      CHAR(1)    POS(342);    // Controller info
           COLOR_DSP     CHAR(1)    POS(343);    // Color capable?
           GRID_DSP      CHAR(1)    POS(344);    // Grid line dsp?
           // The following fields apply to ISDN.
           ISDN_LEN      INT(5)     POS(385);    // Rmt number len
           ISDN_TYPE     CHAR(2)    POS(387);    // Rmt number type
           ISDN_PLAN     CHAR(2)    POS(389);    // Rmt number plan
           ISDN_NUM      CHAR(40)   POS(391);    // Rmt number
           ISDN_SLEN     INT(5)     POS(435);    // Rmt sub-address length
           ISDN_STYPE    CHAR(2)    POS(437);    // Rmt sub-address type
           ISDN_SNUM     CHAR(40)   POS(439);    // Rmt sub-address
           ISDN_CON      CHAR(1)    POS(480);    // Connection
           ISDN_RLEN     INT(5)     POS(481);    // Rmt address len
           ISDN_RNUM     CHAR(32)   POS(483);    // Rmt address
           ISDN_ELEN     INT(5)     POS(519);    // Extension len
           ISDN_ETYPE    CHAR(1)    POS(521);    // Extension type
           ISDN_ENUM     CHAR(40)   POS(522);    // Extension num
           ISDN_XTYPE    CHAR(1)    POS(566);    // X.25 call type
         END-DS;
         DCL-F MYFILE WORKSTN INFDS(ICFATRFBK);
      
         DCL-DS ICFATRFBK;
           PGM_DEV       CHAR(10)   POS(241);    // Program device
           DEV_DSC       CHAR(10)   POS(251);    // Dev description
           USER_ID       CHAR(10)   POS(261);    // User ID
           DEV_CLASS     CHAR(1)    POS(271);    // Device class
           DEV_TYPE      CHAR(1)    POS(272);    // Device type
           REQ_DEV       CHAR(1)    POS(278);    // Requester?
           ACQ_STAT      CHAR(1)    POS(279);    // Acquire status
           INV_STAT      CHAR(1)    POS(280);    // Invite status
           DATA_AVAIL    CHAR(1)    POS(281);    // Data available
           SES_STAT      CHAR(1)    POS(291);    // Session status
           SYNC_LVL      CHAR(1)    POS(292);    // Synch level
           CONV_TYPE     CHAR(1)    POS(293);    // Conversation typ
           RMT_LOC       CHAR(10)   POS(294);    // Remote location
           LCL_LU        CHAR(8)    POS(302);    // Local LU name
           LCL_NETID     CHAR(8)    POS(310);    // Local net ID
           RMT_LU        CHAR(8)    POS(318);    // Remote LU
           RMT_NETID     CHAR(8)    POS(326);    // Remote net ID
           APPC_MODE     CHAR(8)    POS(334);    // APPC Mode
           LU6_STATE     CHAR(1)    POS(345);    // LU6 conv state
           LU6_COR       CHAR(8)    POS(346);    // LU6 conv correlator
           // The following fields apply to ISDN.
           ISDN_LEN      INT(5)     POS(385);    // Rmt number len
           ISDN_TYPE     CHAR(2)    POS(387);    // Rmt number type
           ISDN_PLAN     CHAR(2)    POS(389);    // Rmt number plan
           ISDN_NUM      CHAR(40)   POS(391);    // Rmt number
           ISDN_SLEN     INT(5)     POS(435);    // sub-addr len
           ISDN_STYPE    CHAR(2)    POS(437);    // sub-addr type
           ISDN_SNUM     CHAR(40)   POS(439);    // Rmt sub-address
           ISDN_CON      CHAR(1)    POS(480);    // Connection
           ISDN_RLEN     INT(5)     POS(481);    // Rmt address len
           ISDN_RNUM     CHAR(32)   POS(483);    // Rmt address
           ISDN_ELEN     CHAR(2)    POS(519);    // Extension len
           ISDN_ETYPE    CHAR(1)    POS(521);    // Extension type
           ISDN_ENUM     CHAR(40)   POS(522);    // Extension num
           ISDN_XTYPE    CHAR(1)    POS(566);    // X.25 call type
         DCL-DS ICFATRFBK;
           // The following information is available only when program was started
           // as result of a received program start request. (P_ stands for protected)
           TRAN_PGM      CHAR(64)   POS(567);    // Trans pgm name
           P_LUWIDLN     CHAR(1)    POS(631);    // LUWID fld len
           P_LUNAMELN    CHAR(1)    POS(632);    // LU-NAME len
           P_LUNAME      CHAR(17)   POS(633);    // LU-NAME
           P_LUWIDIN     CHAR(6)    POS(650);    // LUWID instance
           P_LUWIDSEQ    INT(5)     POS(656);    // LUWID seq num
           // The following information is available only when a protected conversation
           // is started on a remote system.  (U_ stands for unprotected)
           U_LUWIDLN     CHAR(1)    POS(658);    // LUWID fld len
           U_LUNAMELN    CHAR(1)    POS(659);    // LU-NAME len
           U_LUNAME      CHAR(17)   POS(660);    // LU-NAME
           U_LUWIDIN     CHAR(6)    POS(677);    // LUWID instance
           U_LUWIDSEQ    INT(5)     POS(683);    // LUWID seq num
         END-DS;
...........................................................................................end INFDS

        d Infds           ds

        d Cmd_Key               369    369
        d  Cmd_F1         c                   Const(x'31')
        d  Cmd_F2         c                   Const(x'32')
        d  Cmd_F3         c                   Const(x'33')
        d  Cmd_F4         c                   Const(x'34')
        d  Cmd_F5         c                   Const(x'35')
        d  Cmd_F6         c                   Const(x'36')
        d  Cmd_F7         c                   Const(x'37')
        d  Cmd_F8         c                   Const(x'38')
        d  Cmd_F9         c                   Const(x'39')
        d  Cmd_F10        c                   Const(x'3A')
        d  Cmd_F11        c                   Const(x'3B')
        d  Cmd_F12        c                   Const(x'3C')
        d  Cmd_F13        c                   Const(x'B1')
        d  Cmd_F14        c                   Const(x'B2')
        d  Cmd_F15        c                   Const(x'B3')
        d  Cmd_F16        c                   Const(x'B4')
        d  Cmd_F17        c                   Const(x'B5')
        d  Cmd_F18        c                   Const(x'B6')
        d  Cmd_F19        c                   Const(x'B7')
        d  Cmd_F20        c                   Const(x'B8')
        d  Cmd_F21        c                   Const(x'B9')
        d  Cmd_F22        c                   Const(x'BA')
        d  Cmd_F23        c                   Const(x'BB')
        d  Cmd_F24        c                   Const(x'BC')
        d  Cmd_Clear      c                   Const(x'BD')
        d  Cmd_Enter      c                   Const(x'F1')
        d  Cmd_Help       c                   Const(x'F3')
        d  Cmd_Up         c                   Const(x'F4')
        d  Cmd_Down       c                   Const(x'F5')
        d  Cmd_Print      c                   Const(x'F6')
*inlr = '0';
