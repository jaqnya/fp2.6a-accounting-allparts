SET TALK OFF
archi_01 = createmp()
create table &archi_01 (cadena c(80))
mserie = ''
use &archi_01 alias TEMPORAL
SET COLOR TO N, N
RUN dir c:\DD >system.txt
APPEND FROM system.txt TYPE SDF
GOTO 3
auxicar = ALLTRIM(cadena)
FOR i = LEN(auxicar) TO 1 STEP -1
     IF SUBSTR(auxicar, i, 1) =  ;
        SPACE(1)
          mserie = SUBSTR(auxicar,  ;
                   i + 1,  ;
                   LEN(auxicar))
          i = 0
     ENDIF
ENDFOR
SET COLOR TO
CLEAR
DELETE FILE system.txt
USE
DO borratm WITH archi_01
SET COLOR TO
IF !INLIST(mserie, '728D-F305')
     WAIT WINDOW NOWAIT ''
     CLEAR TYPEAHEAD
     QUIT
ENDIF
RETURN
*
FUNCTION createmp
DO WHILE .T.
     var = 'TM' + SUBSTR(TIME(),  ;
           1, 2) + SUBSTR(TIME(),  ;
           4, 2) + SUBSTR(TIME(),  ;
           7, 2)
     IF  .NOT. FILE(var + '.DBF')  ;
         .AND.  .NOT. FILE(var +  ;
         '.NTX')
          var1 = 'VAR'
          VARI = &VAR1
          EXIT
     ENDIF
ENDDO
RETURN vari
*
PROCEDURE borratm
PARAMETER aborrar
PRIVATE architm1, architm2,  ;
        architm3
architm1 = aborrar + '.DBF'
architm2 = aborrar + '.IDX'
architm3 = aborrar + '.VUE'
IF FILE(architm1)
     delete file &architm1
ENDIF
IF FILE(architm2)
     delete file &architm2
ENDIF
IF FILE(architm3)
     delete file &architm3
ENDIF
RETURN
*
