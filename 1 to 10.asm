
 .MODEL SMALL
 .STACK 100H
 .DATA
     
     NUM DW ?    
        
;Here i use Comment 1,2,3,4.....n.And Discussion Assignment Section.         
        
; Comment no  1                                        
        lbk    db  13,10,'$'      
        
; Comment no 2       
        numstr db '$$'     

     .CODE
     MAIN PROC
          MOV AX,@DATA
          MOV DS,AX
   
 
;Comment no 3 
 
         MOV NUM, 1
                  
         START:  
         
        
           
;Comment no  4
         CMP NUM, 10    
         JBE PRINT                 
         JMP close
         
       PRINT:
;       MOV AH,2           
;       MOV DL,NUM          
;       INT 21H            

 

; Comment no 5 
         mov  si, offset numstr
         mov  ax, num
         call number2string    

;Comment no 6
         mov  ah, 9
         mov  dx, offset numstr
         int 21h     

;Comment no 7 
     
         mov  ah, 9
         mov  dx, offset lbk
         int 21h 
             
;Comment no 7      

         INC NUM            
         JMP START

     close:
         MOV Ax,4C00H
         int 21h
         MAIN ENDP


 
number2string proc 
  call dollars 
  mov  bx, 10  
  mov  cx, 0  
  
joymondal1:   
    
  mov  dx, 0   
  div  bx      
  push dx     
  inc  cx     
  cmp  ax, 0  
  jne  joymondal1  

joymondal2:  
  pop  dx        
  add  dl, 48  
  mov  [ si ], dl
  inc  si
  loop joymondal2  

  ret
  
number2string endp       


proc dollars                 
  mov  cx, 5
  mov  di, offset numstr 
  
dollars_sign:      

  mov  bl, '$'
  mov [ di ], bl
  inc  di
  loop dollars_sign

  ret 
 endp  

 END MAIN