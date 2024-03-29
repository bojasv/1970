File I/O Keywords, OpCodes and BIFs

KeyWords
PREFIX(prefix_name{:nbr_of_characters_replaced})
RENAME(ext_format:int_format)
USROPN
INFDS(data_structure_name)
INFSR(subroutine_name)
INCLUDE(record_format_name:record_format_name:...)
IGNORE(record_format_name:record_format_name:...)
COMMIT{(rpg_name)}
ROLBK {(E)} (Roll Back)
BLOCK(*NO | *YES)

OpCodes
KLIST (Define a Composite Key)
KFLD (Define Parts of a Key)
OPEN {(E)} (Open File for Processing)
CLOSE {(E)} (Close Files)
COMMIT {(E)} (Commit)

SETLL {(E)} (Set Lower Limit) 
SETGT {(E)} (Set Greater Than)
CHAIN {(N | E)} (Random Retrieval from a File)

READ {(N | E)} (Read a Record)        
READC {(E)} (Read Next Changed Record)
READE {(N | E)} (Read Equal Key)      
READP {(N | E)} (Read Prior Record)   
READPE {(N | E)} (Read Prior Equal)   

WRITE (Create New Records)
EXFMT {(E)} (Write/Then Read Format)
UPDATE (Modify Existing Record)
DELETE {(E)} (Delete Record)

BIFs
%OPEN (Return File Open Condition)
%EOF (Return End or Beginning of File Condition)
%FOUND (Return Found Condition)
%EQUAL (Return Exact Match Condition)
%ERROR (Return Error Condition)
%STATUS (Return File or Program Status)
%TLOOKUPxx (Look Up a Table Element)
%NULLIND (Query or Set Null Indicator)

