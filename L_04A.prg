PARAMETER pdestino
STORE 0 TO suma1, suma2, mnro
SELECT cuentas
SET ORDER TO 1
SELECT movimiento
SET RELATION TO cuenta INTO cuentas
SET ORDER TO 1
GOTO TOP
DO WHILE nroasiento<mrangon1  ;
   .AND.  .NOT. EOF()
     DO CASE
          CASE tipomovi = 'D'
               suma1 = suma1 +  ;
                       monto
          CASE tipomovi = 'C'
               suma2 = suma2 +  ;
                       monto
     ENDCASE
     SKIP 1
ENDDO
IF EOF()
     SET ORDER TO 1
     SET RELATION TO
     WAIT WINDOW  ;
          'NO EXISTEN DATOS QUE CUMPLAN CON LA CONDICION !'
     RETURN
ENDIF
DO activa_set
IF pdestino
     listado = createmp() +  ;
               '.TXT'
     set device to file &listado
ENDIF
STORE 0 TO linea, pagina, mtotald,  ;
      mtotalc
mnro = nroasiento
DO l_04aa
DO WHILE nroasiento<=mrangon2  ;
   .AND.  .NOT. EOF()
     DO l_04ab
     SKIP 1
     DO CASE
          CASE EOF()
               IF linea <= cml -  ;
                  6
                    DO l_04ac  ;
                       WITH .T.
                    DO l_04ad  ;
                       WITH .F.
               ELSE
                    DO l_04aa
                    DO l_04ac  ;
                       WITH .F.
                    DO l_04ad
               ENDIF
          CASE mnro <> nroasiento
               IF linea <= cml -  ;
                  6
                    DO l_04ac  ;
                       WITH .T.
                    IF nroasiento <=  ;
                       mrangon2
                         mnro = nroasiento
                         IF linea >=  ;
                            cml -  ;
                            6
                              DO l_04ad  ;
                                 WITH  ;
                                 .F.
                              DO l_04aa
                         ELSE
                              DO l_04ae
                         ENDIF
                    ENDIF
               ELSE
                    DO l_04ad  ;
                       WITH .T.
                    DO l_04aa
                    DO l_04ac  ;
                       WITH .F.
                    IF nroasiento <=  ;
                       mrangon2
                         mnro = nroasiento
                         DO l_04ae
                    ENDIF
               ENDIF
          CASE mnro = nroasiento
               IF linea >= cml -  ;
                  6
                    DO l_04ad  ;
                       WITH .T.
                    DO l_04aa
               ENDIF
     ENDCASE
ENDDO
SET RELATION TO
SET ORDER TO 1
@ PROW() + 1, 00 SAY ''
@ PROW() + 1, 00 SAY ''
DO desactiva_
KEYBOARD '{spacebar}'
WAIT WINDOW ''
IF pdestino
     DEACTIVATE WINDOW l_04
     SAVE SCREEN TO l_04
     IF mvisualiza = 'R'
          SET DISPLAY TO VGA50
     ENDIF
     DEFINE WINDOW listado FROM  ;
            00, 00 TO  ;
            IIF(mvisualiza = 'N',  ;
            24, 49), 79 GROW ZOOM  ;
            TITLE 'LIBRO DIARIO'
     ACTIVATE WINDOW listado
     modify comm &listado noedit window;
listado
     DEACTIVATE WINDOW listado
     RELEASE WINDOW listado
     delete file &listado
     SET DISPLAY TO VGA25
     RESTORE SCREEN FROM l_04
     ACTIVATE WINDOW l_04
ENDIF
RETURN
*
PROCEDURE l_04aa
pagina = pagina + 1
IF pagina > 1
     @ PROW() + (cml - linea) + 1,  ;
       00 SAY ''
ENDIF
mtitulo = 'LIBRO DIARIO, Asientos del ' +  ;
          ALLTRIM(TRANSFORM(mrangon1,  ;
          '99,999')) + ' al ' +  ;
          ALLTRIM(TRANSFORM(mrangon2,  ;
          '99,999'))
@ PROW(), 00 SAY SPACE(3) +  ;
  ALLTRIM(empresas.nombre)
@ PROW(), 119 SAY 'Pagina: ' +  ;
  ALLTRIM(TRANSFORM(pagina,  ;
  '9,999'))
@ PROW() + 1, 03 SAY empresas.ruc
@ PROW(), 67 - INT(LEN(mtitulo) /  ;
  2) SAY mtitulo
@ PROW() + 1, 00 SAY  ;
  '旼컴컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴커'
@ PROW() + 1, 00 SAY  ;
  '�      CODIGO      � CUENTA                                  � CONCEPTO                             �      DEBITO    �     CREDITO   �'
@ PROW() + 1, 00 SAY  ;
  '읕컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴좔컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴켸'
IF pagina > 1
     @ PROW() + 1, 33 SAY  ;
       'T R A N S P O R T E'
     @ PROW(), 103 SAY  ;
       TRANSFORM(suma1,  ;
       '99,999,999,999')
     @ PROW(), PCOL() + 2 SAY  ;
       TRANSFORM(suma2,  ;
       '99,999,999,999')
ENDIF
@ PROW() + 1, 00 SAY  ;
  '  ASIENTO N�: ' +  ;
  ALLTRIM(TRANSFORM(mnro,  ;
  '99,999')) + ' - ' +  ;
  DTOC(fecha)
@ PROW() + 1, 00 SAY ' ' +  ;
  REPLICATE('�', 132)
linea = 7
IF pagina > 1
     linea = 8
ENDIF
RETURN
*
PROCEDURE l_04ab
@ PROW() + 1, 00 SAY ' ' + cuenta +  ;
  '  ' + cuentas.nombre + ' ' +  ;
  concepto + ' '
IF tipomovi = 'D'
     @ PROW(), PCOL() SAY  ;
       TRANSFORM(monto,  ;
       '99,999,999,999') +  ;
       '                  '
     suma1 = suma1 + monto
     mtotald = mtotald + monto
ELSE
     @ PROW(), PCOL() SAY  ;
       '                ' +  ;
       TRANSFORM(monto,  ;
       '99,999,999,999') + '  '
     suma2 = suma2 + monto
     mtotalc = mtotalc + monto
ENDIF
linea = linea + 1
RETURN
*
PROCEDURE l_04ac
PARAMETER pcon_raya
IF pcon_raya
     @ PROW() + 1, 00 SAY ' ' +  ;
       REPLICATE('�', 132)
     linea = linea + 1
ENDIF
@ PROW() + 1, 73 SAY  ;
  'TOTAL DEL ASIENTO:'
@ PROW(), 103 SAY  ;
  TRANSFORM(mtotald,  ;
  '99,999,999,999')
@ PROW(), PCOL() + 2 SAY  ;
  TRANSFORM(mtotalc,  ;
  '99,999,999,999')
STORE 0 TO mtotald, mtotalc
linea = linea + 1
RETURN
*
PROCEDURE l_04ad
PARAMETER pcon_raya
IF pcon_raya
     @ PROW() + 1, 00 SAY ' ' +  ;
       REPLICATE('�', 132)
     @ PROW() + 1, 33 SAY  ;
       'T R A N S P O R T E'
     @ PROW(), 103 SAY  ;
       TRANSFORM(suma1,  ;
       '99,999,999,999')
     @ PROW(), PCOL() + 2 SAY  ;
       TRANSFORM(suma2,  ;
       '99,999,999,999')
ELSE
     @ PROW() + 2, 33 SAY  ;
       'T R A N S P O R T E'
     @ PROW(), 103 SAY  ;
       TRANSFORM(suma1,  ;
       '99,999,999,999')
     @ PROW(), PCOL() + 2 SAY  ;
       TRANSFORM(suma2,  ;
       '99,999,999,999')
ENDIF
linea = linea + 2
RETURN
*
PROCEDURE l_04ae
@ PROW() + 1, 00 SAY  ;
  '  ASIENTO N�: ' +  ;
  ALLTRIM(TRANSFORM(mnro,  ;
  '99,999')) + ' - ' +  ;
  DTOC(fecha)
@ PROW() + 1, 00 SAY ' ' +  ;
  REPLICATE('�', 132)
linea = linea + 2
RETURN
*
