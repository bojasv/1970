        XX999D*Name++++++++++ETDsFrom+++To/L+++IDc.Keywords
        *char
        D Alpha1          S             10A
        *dcl-s $Alpha1 char(10) ;
        D Alpha2          S                   like(Alpha1)
        D                                     inz(*all'*')
        *dcl-s $Alpha2 like($Alpha1) inz(*all'*') ;
        *unsigned numeral
        D Packed1         S              7P 0
        *dcl-s $Packed1 packed(7) ;
        D Packed2         S              5  2
        *dcl-s $Packed2 packed(5:2) ;
        *signed numeral
        D Signed1         S              7S 2
        *dcl-s $Signed1 zoned(7:2) ;
        *integer, unsigned integer, and float numeric variables
        D Int1            S              3I 0
        *dcl-s $Int1 int(3) ;
        D Uns1            S              3U 0
        *dcl-s $Uns1 uns(3) ;
        D Float1          S              8F
        *dcl-s $Float1 float(8) ;
        *date, time, timestamp
        D Date1           S               D   datfmt(*iso)
        *dcl-s $Date1 date(*iso) ;
        D Time1           S               T
        *dcl-s $Time1 time ;
        D TimeStamp1      S               Z
        *dcl-s $TimeStamp1 timestamp ;
        *indicator variable
        D Ind1            S               N
        *dcl-s $Ind1 ind ;
        *binary variable
        D Bin1            S              5B 0
        *dct-s $Bin1 bindec(5) ;
        *pointer variable
        D Pointer1        S               *   inz(%addr(alpha1))
        *dcl-s $Pointer1 pointer ;
        *array
        D Array1          S              3    dim(100)
        *dcl-s $Array1 char(3) dim(100) ;
        *tables (or compile time array)
        D Table1          S              7    dim(3) ctdata
        *dcl-s TabTable1 char(7) dim(3) ctdata ;
        *DTAARA variable
        D TestDa1         S             10    dtaara('TESTDA')
        *dcl-s $TestDa1 char(10) dtaara('TESTDA') ;
        
         *inlr = '0';
        
        FFilename++IPEASFRlen+LKlen+AIDevice+.Keywords+++++++++++++++++++++++++++++Comments++++++++++
        FMYFILE    IF   E             DISK    INFDS(FILEFBK)
        DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++++++Comments++++++++++
        DFILEFBK          DS
        D FILE              *FILE                                                  * File name
        D OPEN_IND                9      9N                                        * File open?
        D EOF_IND                10     10N                                        * File at eof?
        D STATUS            *STATUS                                                * Status code
        D OPCODE            *OPCODE                                                * Last opcode
        D ROUTINE           *ROUTINE                                               * RPG Routine
        D LIST_NUM               30     37                                         * Listing line
        D SPCL_STAT              38     42S 0                                      * SPECIAL status
        D RECORD            *RECORD                                                * Record name
        D MSGID                  46     52                                         * Error MSGID
        D SCREEN            *SIZE                                                  * Screen size
        D NLS_IN            *INP                                                   * NLS Input?
        D NLS_OUT           *OUT                                                   * NLS Output?
        D NLS_MODE          *MODE                                                  * NLS Mode?
