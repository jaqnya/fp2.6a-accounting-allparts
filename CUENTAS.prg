ON KEY LABEL 'F1' do CUENTASA
ON KEY LABEL 'F2' do CUENTASA
ON KEY LABEL 'F3' do CUENTASA
ON KEY LABEL 'F4' do CUENTASA
ON KEY LABEL 'F5' do CUENTASA
ON KEY LABEL 'F7' do CUENTASA
ON KEY LABEL 'F8' do CUENTASA
ON KEY LABEL 'F9' do CUENTASA
ON KEY LABEL 'F11' do CUENTASA
ON KEY LABEL 'ALT+C' do CUENTASA
DO mb_01
ON KEY LABEL 'F1'
ON KEY LABEL 'F2'
ON KEY LABEL 'F3'
ON KEY LABEL 'F4'
ON KEY LABEL 'F5'
ON KEY LABEL 'F7'
ON KEY LABEL 'F8'
ON KEY LABEL 'F9'
ON KEY LABEL 'F11'
ON KEY LABEL 'ALT+C'
DO ei_archivo
RETURN
*
PROCEDURE cuentasa
ON KEY LABEL 'F1'
ON KEY LABEL 'F2'
ON KEY LABEL 'F3'
ON KEY LABEL 'F4'
ON KEY LABEL 'F5'
ON KEY LABEL 'F7'
ON KEY LABEL 'F8'
ON KEY LABEL 'F9'
ON KEY LABEL 'F11'
ON KEY LABEL 'ALT+C'
DO CASE
     CASE LASTKEY() = k_f1
          DO ayuda WITH 'general'
     CASE LASTKEY() = k_f2
          DO agregar
     CASE LASTKEY() = k_f3
          DO modifica
     CASE LASTKEY() = k_f4
          DO ordenar
     CASE LASTKEY() = k_f5
          DO busqueda
     CASE LASTKEY() = k_f7
          DO reloj
     CASE LASTKEY() = k_f8
          DO borrar
     CASE LASTKEY() = k_f9
          DO teclas WITH 'normal'
     CASE LASTKEY() = k_f10
          DO mi_browse
     CASE LASTKEY() = k_f11
          DO calendar
     CASE LASTKEY() = 46
          DO o_06
ENDCASE
ON KEY LABEL 'F1' do CUENTASA
ON KEY LABEL 'F2' do CUENTASA
ON KEY LABEL 'F3' do CUENTASA
ON KEY LABEL 'F4' do CUENTASA
ON KEY LABEL 'F5' do CUENTASA
ON KEY LABEL 'F7' do CUENTASA
ON KEY LABEL 'F8' do CUENTASA
ON KEY LABEL 'F9' do CUENTASA
ON KEY LABEL 'F11' do CUENTASA
ON KEY LABEL 'ALT+C' do CUENTASA
RETURN
*
