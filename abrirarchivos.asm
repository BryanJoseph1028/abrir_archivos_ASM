org 100h
 mov al, 0 ;modo de acceso para abrir arhivo, modo lectura/escritura
 mov dx, offset archivo ;offset lugar de memoria donde esta la variable
 mov ah, 3dh ;se intenta abrir el archivo
 int 21h ;llamada a la interrupcion DOS
 jc error ; si se prendio la bandera c ir a error

 mov handle, ax ;si no paso mover a lo que le dio el SO
 jmp leer

 error:
 ; ....

 ;leer archivo 
 leer:
 mov bx, handle
 mov cx, 5
 mov dx, offset leido
 mov ah, 3fh
 int 21h

 ;cerramos archivo
 mov bx, handle
 mov ah, 3eh
 int 21h 

 ;imprimir el contenido de leido
 mov dx, offset leido
 mov ah, 9
 int 21h

 ret 

archivo db "C:\prueba.txt", 0 ;ascii del nombre del archivo 
leido db "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
handle dw ? ;identificador del arhivo


