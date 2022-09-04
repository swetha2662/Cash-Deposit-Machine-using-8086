data segment  
    n1 dw 0
    numberplace dw 10
    number dw 0  
    acno dw 0
    amount dw 0 
    amount2 dw 0
    hundred dw 0
    fivehundred dw 0
    twothousand dw 0  
    sum dw 0 
    cnt db 0
    temp dw 0 
    ac1 dw 10001,'Swetha$',10000
    ac2 dw 10002,'Sneeja$',10000
    ac3 dw 10003,'Shivesh$',7500
    ac4 dw 10004,'Selvan$',5000
                                                                       
    msginvalid db 0ah,0dh,"Invalid entry ! Re-enter  $"
    prompt db 10,13,"Enter last 5 digit of account number : $" 
    doesnt db 10,13,10,13,"Account number not found!$" 
    newline db 13,10,'$'
    amt db 10,13,"Enter the amount : $"
    denom db 10,13,"Enter the denominations $"
    
    hun db 10,13," 100   : $"
    five dw 10,13,"500   : $"
    thous dw 10,13,"2000  : $"
    total db 10,13,"Total amount in denomination : $"    
    name1 db 10,13,10,13,"  Name            : $"
    bal db 10,13,10,13,"  Balance         : $" 
    wtdrw db 10,13,10,13,"Enter the amount to withdraw  : $"
    wdwexceed db 10,13,10,13,"Insufficient Balance to withdraw!$"
     
    summary db 10,13,10,13,"PROCESSING THE SUMMARY$"
    processing db 10,13,10,13,"PROCESSING$"    
    smry db 10,13,10,13,"     TRANSACTION SUMMARY$"  
    
    aftrwdrw  db 10,13,10,13,'  Please collect the cash ',0ah,0dh
              db '  After withdrawal',0ah,0dh
              db '$',0ah,0dh   
                                                     
    accnum db 10,13,10,13,"  Account number    : $"   
    npkey db 10,13,10,13,"DENOMINATIONS DOESNOT MATCH ENTERED AMOUNT!$"  
    retry db 10,13,10,13,"ERROR ! PROCESS SUSPENDED$"  
    exceed db 10,13,10,13,"Exceeded limit...! Re-enter$"
    cont db 10,13,10,13,"Press Enter to go to homepage ... $"
    dep db 10,13,10,13,"  Deposited successfully !$" 
    tk db 10,13,10,13,"  Thank You for using our service!$"
    
    alpha db "X$"  
    amont db "  Amount          : $"  
    amontdep db "  Amount deposited  : $" 
    common db "256101$"
    msg db "  Time           : "
    hrs db ?,?,' : '
    mins db ?,?,'   (hh:mm) ',10,13
    db "  Date           : "
    da db ?,?, '/'
    mon db ?,?, '/'
    yea db ?,?, ' (dd/mm/yy)', 10,13,'$'  
    
    StartScreen db '              ====================================================',0ah,0dh
                db '             ||                                                  ||',0ah,0dh                                        
                db '             ||         >>     CASH DEPOSIT MACHINE   <<         ||',0ah,0dh
                db '             ||__________________________________________________||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||               TERMS AND CONDITIONS               ||',0ah,0dh          
                db '             ||                                                  ||',0ah,0dh          
               ;db '             ||    The Cash Deposit Machine is a self service    ||',0ah,0dh
               ;db '             ||     terminal that enables you to deposit cash    ||',0ah,0dh
               ;db '             ||        without any manual intervention           ||',0ah,0dh
               ;db '             ||                                                  ||',0ah,0dh
                db '             ||   Deposit your cash through the simple and fast  ||',0ah,0dh
                db '             ||       CDM installed in the branch and get        ||',0ah,0dh
                db '             ||          instant credit in your account          ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||   Only 100,500,2000 rupee notes are accepted !   ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||              Press Enter to continue             ||',0ah,0dh
                db '             ||              Press ESC to Exit                   ||',0ah,0dh
                db '              ====================================================',0ah,0dh
                db '$',0ah,0dh    
                
    homescreen  db 10,13,'              ====================================================',0ah,0dh
                db '             ||                                                  ||',0ah,0dh                                        
                db '             ||          >>     WELCOME TO ABC BANK  <<          ||',0ah,0dh
                db '             ||__________________________________________________||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh          
                db '             ||                                                  ||',0ah,0dh          
                db '             ||                     OPTIONS                      ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||         1. Deposit                               ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||         2. Withdraw                              ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh                       
                db '             ||         3. Check Balance                         ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||         4. Exit                                  ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
               ;db '             ||                                                  ||',0ah,0dh
               ;db '             ||                                                  ||',0ah,0dh
                db '             ||                                                  ||',0ah,0dh
                db '              ====================================================',0ah,0dh
                db '$',0ah,0dh              
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    call nline
                
    lea dx,StartScreen 
    mov ah, 9
    int 21h 
    
    checkforinput:   
    
    mov AH,0            
    int 16H
    cmp al,13                 ;Enter to Start Game  
    JE ui   
    
    cmp ah,1H                 ;Esc to exit the game
    JE ExitMenu
    JNE checkforinput 
    
    ExitMenu: 
    
    mov ah,4CH
    int 21H
    
    ui:   
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    lea dx,homescreen 
    mov ah, 9
    int 21h
    
    
    checkforinput1:  
    
    
    mov ah,01
    int 21h 
    
   
    sub al,30h
    cmp al,1                 ;Enter to Start Game    
    je deposit   
                        
    cmp al,2
    je withdraw
    
    cmp al,3
    je balance                    
                        
    cmp al,4                ;Esc to exit the game
    je ExitMenu   
    
    ;JNE checkforinput1 
    
withdraw:  

    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
              
    lea dx, prompt
    mov ah, 9
    int 21h        ; output string at ds:dx     
 
    call nline  
   
    call getno
    mov acno,ax 
    
comp1:
    
    lea si,ac1 
    mov ax,[si] 
    
    cmp ax,acno
    jne comp2
    
    mov ax,00
        
    lea dx,wtdrw
    mov ah,09
    int 21h
    
    call getno
    mov amount,ax 
    
    
    add si,0ah 
    mov ax,[si] 
    
    cmp amount,ax
    ja wtdrwlimit    
    
    mov ax,[si]       
    sub ax,amount  
    mov [si],ax    
    
    call nline
    
    lea dx,aftrwdrw
    mov ah,09
    int 21h  
    
    lea dx,bal
    mov ah,09
    int 21h
    
    mov cx,[si]
    call print_val
    
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start
              
    
    
comp2:    

    lea si,ac2 
    mov ax,[si] 
    
    cmp ax,acno
    jne comp3
    
    mov ax,00
    
    lea dx,wtdrw
    mov ah,09
    int 21h
    
    call getno
    mov amount,ax 
    
    
    add si,0ch  
    mov ax,[si] 
    
    cmp amount,ax
    ja wtdrwlimit    
    
    mov ax,[si]       
    sub ax,amount  
    mov [si],ax    
    
    call nline  
    
    lea dx,bal
    mov ah,09
    int 21h
    
    mov cx,[si]
    call print_val
    
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start



comp3:

    lea si,ac3
    mov ax,[si] 
    
    cmp ax,acno
    jne comp4
    
    mov ax,00
    
    lea dx,wtdrw
    mov ah,09
    int 21h
    
    call getno
    mov amount,ax 
    
    
    add si,08
    mov ax,[si] 
    
    cmp amount,ax
    ja wtdrwlimit    
    
    mov ax,[si]       
    sub ax,amount  
    mov [si],ax    
    
    call nline  
    
    lea dx,bal
    mov ah,09
    int 21h
    
    mov cx,[si]
    call print_val
    
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start

comp4:
      
    lea si,ac4
    mov ax,[si] 
    
    cmp ax,acno
    jne dontmatch
    
    mov ax,00
    
    lea dx,wtdrw
    mov ah,09
    int 21h
    
    call getno
    mov amount,ax 
    
    
    add si,0ah 
    mov ax,[si] 
    
    cmp amount,ax
    ja wtdrwlimit    
    
    mov ax,[si]       
    sub ax,amount  
    mov [si],ax    
    
    call nline  
    
    lea dx,bal
    mov ah,09
    int 21h
    
    mov cx,[si]
    call print_val
    
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start    
    
wtdrwlimit:   

    lea dx,wdwexceed
    mov ah,09
    int 21h
    
    call nline
    call nline
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start
          
   
balance:

    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
              
    lea dx, prompt
    mov ah, 9
    int 21h        ; output string at ds:dx     
    
 
    call nline  
   
    call getno
    mov acno,ax  
    
    call nline
    
    lea si,ac1
    mov ax,[si]
    
    cmp acno,ax
    jne c2  
    
   
    lea dx,accnum
    mov ah,09
    int 21h   
  
    call printaccno   
                   
    call nline 
    
    add si,02
    ;inc si  
    ;inc si  
    
    lea dx,name1
    mov ah,09
    int 21h  
    
    lea dx,si
    mov ah,09
    int 21h 
    
    lea si,ac1
    
    add si,0ah 
    
    lea dx,bal
    mov ah,09
    int 21h  
    
    mov cx,[si]
    call print_val  
    
    lea dx,tk
    mov ah,09
    int 21h 
    
    call nline
    call nline
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start
 
 
 c2: 
     
    lea si,ac2
    mov ax,[si]
    
    cmp acno,ax
    jne c3 
    
    
    lea dx,accnum
    mov ah,09
    int 21h   
  
    call printaccno   
                   
    call nline 
    
    add si,02
    ;inc si  
    ;inc si   
    
    lea dx,name1
    mov ah,09
    int 21h  
    
    lea dx,si
    mov ah,09
    int 21h 
    
    lea si,ac2
    
    add si,0ch 
    
    lea dx,bal
    mov ah,09
    int 21h  
    
    mov cx,[si]
    call print_val
    
    
    lea dx,tk
    mov ah,09
    int 21h
      
    call nline
    call nline
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start
   
c3: 
    
    lea si,ac3
    mov ax,[si]
    
    cmp acno,ax
    jne c4 
    
    
    lea dx,accnum
    mov ah,09
    int 21h   
  
    call printaccno   
                   
    call nline 
    
    add si,02
    ;inc si  
    ;inc si   
    
    lea dx,name1
    mov ah,09
    int 21h  
    
    lea dx,si
    mov ah,09
    int 21h 
    
    lea si,ac3
    
    add si,08 
    
    lea dx,bal
    mov ah,09
    int 21h  
    
    mov cx,[si]
    call print_val 
    
    
    lea dx,tk
    mov ah,09
    int 21h
     
    call nline
    call nline
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start
    
    
c4:  
    
    lea si,ac4
    mov ax,[si]
    
    cmp acno,ax
    jne dontmatch 
    
    
    lea dx,accnum
    mov ah,09
    int 21h   
  
    call printaccno   
                   
    call nline 
    
    add si,02
    ;inc si  
    ;inc si   
    
    lea dx,name1
    mov ah,09
    int 21h  
    
    lea dx,si
    mov ah,09
    int 21h 
    
    lea si,ac4
    
    add si,0ah 
    
    lea dx,bal
    mov ah,09
    int 21h  
    
    mov cx,[si]
    call print_val 
    
    
    lea dx,tk
    mov ah,09
    int 21h
     
    call nline
    call nline
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start
    
dontmatch:

    lea dx,doesnt
    mov ah,09
    int 21h  
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start  

deposit:
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
              
    lea dx, prompt
    mov ah, 9
    int 21h        ; output string at ds:dx     
    
     ;newly added 
 
    call nline  
   
    call getno
    mov acno,ax  
              
    call nline
    
    lea si,ac1 
    mov ax,[si] 
    
    cmp ax,acno
    jne cmp2
    
    mov ax,00 
    
    call getdeposit
    
    lea si,ac1 
        
    add si,0ah 
    ;add si,amount
    mov ax,00
    mov ax,[si] 
         
    add ax,amount  
    mov [si],ax    
    
    call nline  

    jmp summary1  

cmp2:

    lea si,ac2
    mov ax,[si] 
    
    cmp ax,acno
    jne cmp3
    
    mov ax,00 
    
    call getdeposit
    
    lea si,ac2 
        
    add si,0ch 
    ;add si,amount
    mov ax,00
    mov ax,[si] 
         
    add ax,amount  
    mov [si],ax    
    
    call nline  

    jmp summary1  
              
cmp3:

    lea si,ac3
    mov ax,[si] 
    
    cmp ax,acno
    jne cmp4
    
    mov ax,00 
    
    call getdeposit
    
    lea si,ac3 
        
    add si,08
    ;add si,amount
    mov ax,00
    mov ax,[si] 
         
    add ax,amount  
    mov [si],ax    
    
    call nline  

    jmp summary1
    
cmp4:  

    lea si,ac4
    mov ax,[si] 
    
    cmp ax,acno
    jne dontmatch
    
    mov ax,00 
    
    call getdeposit
    
    lea si,ac4
        
    add si,0ah 
    ;add si,amount
    mov ax,00
    mov ax,[si] 
         
    add ax,amount  
    mov [si],ax    
    
    call nline  

    jmp summary1

   
   
summary1: 

    lea dx,summary
    mov ah, 9
    int 21h
    
    mov ah,0            
    int 16h
       
    jmp summary2
    

summary2:
   
   
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
   
    lea dx,smry
    mov ah,09
    int 21h  
   
    call nline
     
    call nline
   
    call nline 
   

    ;DATE AND TIME
   
    mov ah,2ch            ; DOS function to read system time
    int 21h
    mov al,ch             ; load the hours to ‘al’
    aam                   ; ASCII adjust after multiplication
    add ax, 3030h
    mov hrs, ah
    mov hrs+1, al
    mov al,cl             ; load the seconds to ‘al’
    aam
    add ax, 3030h
    mov mins, ah
    mov mins+1,al
   
    ; Day Part
    mov AH, 2AH          ; To get System Date
    INT 21H
    mov AL, DL           ; Day is in DL
    AAM
    Add ax,3030h
    mov da,Ah
    mov da +1, al
    mov AL, DH           ; Month is in DH
    AAM
    Add ax, 3030h
    mov mon,AH
    mov mon+1,al
   
    ; YEAR
    ADD CX, 0F830H        ; To negate the effects of 16bit value,
    mov Al, cl            ; since AAM is applicable only for AL (YYYY -> YY)
    aam
    Add ax, 3030h
    mov yea,ah
    mov yea+1,al
    lea dx,msg            ; Display the time
    mov ah,09h
    int 21h
    ;int 3

   
    lea dx,accnum
    mov ah,09
    int 21h   
  
    call printaccno   
                   
    call nline 
                  
    lea dx,amontdep
    mov ah,09
    int 21h
    
    mov cx,sum
        
    call print_val
    
    call nline
    
    lea dx,bal
    mov ah,09
    int 21h
    
    mov cx,[si]
    call print_val
     
    
    lea dx,dep
    mov ah,09
    int 21h
   
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start
   
          
exit:

    mov ah,4ch
    int 21h    
           
nline proc   
    
    lea dx, newline
    mov ah, 9
    int 21h
    ret    
    
endp nline 

getdeposit proc
    
reenter:    
        
    lea dx,amt
    mov ah,9
    int 21h 
    
    call nline   
   
    call getno
    
    mov amount,ax
     
    
    mov bx,00 
    mov bx,50000
    
    ;50000 = 11000011 01010000
    
    cmp amount,bx
    ja limit 

    call nline
   
    lea dx,denom
    mov ah,9
    int 21h  
   
    call nline
   
    lea dx,hun
    mov ah,9
    int 21h  
   
    call getno
    mov hundred,ax  
   
   
    lea dx,five
    mov ah,9
    int 21h
             
    call getno
    mov fivehundred,ax          
             
    lea dx,thous
    mov ah,9
    int 21h      
                 
    call getno
    mov twothousand,ax
                     
    lea dx,processing
    mov ah,09
    int 21h
   
    mov ax,hundred
    mov bx,100
    mul bx
   
    mov sum,ax
   
    mov ax,fivehundred
    mov bx,500
    mul bx
   
    add sum,ax
    mov ax,sum
   
    mov ax,twothousand
    mov bx,2000
    mul bx
   
    add sum,ax
    mov ax,sum
    
    call nline
   
   
    lea dx,total
    mov ah, 9
    int 21h  
   
    mov cx,sum
    call print_val   
   
    mov ax,amount
    mov bx,sum 
    
    cmp ax,bx
    jne notpossible  
    ret
    
limit: 

    lea dx,exceed
    mov ah,09
    int 21h 
    
    call nline
    
    jmp reenter     
    
notpossible:

    lea dx,npkey
    mov ah,09
    int 21h 
            
    lea dx,retry
    mov ah,09
    int 21h 
    
    lea dx,cont 
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov ah,0fh
    int 10h
   
    mov ah,0
    int 10h
    
    
    jmp start 
    
        
    
endp getdeposit    


printaccno proc   
    
    mov cx,0  
    
    lea dx,common
    mov ah,09
    int 21h
            
    l1:
            
    lea dx,alpha
    mov ah,09
    int 21h 
    inc cx
    cmp cx,10
    jne l1 
    ret
    
printaccno endp  
      
getno proc
    
    
setno:
   
    mov number,0    ; set initial value of number to 0    
   
readno:
   
    mov ah,01h  
    int 21h    
   
    cmp al,0dh         ;check if enter key is pressed
    je n
    ; jump to n if enter key is pressed
   
    ;to check if between 0 & 9
   
    cmp al,30h                        
    jb invalidch
 
    cmp al,39h          
    ja invalidch
   
   
    sub al,30h
    mov ah,00                            
    mov bx,ax       ; temporarily store value in bx
   
    mov ax,number   ; copy number to ax
    mul numberplace ; we multiply number with 10.
                    ; 1st time 0 so zero
   
    add ax,bx       ; add the newly entered number to number variable
    mov number,ax
   
   
    jmp readno
    jmp n
   
invalidch:

    mov ah,09h  
    mov dx,offset msginvalid    
    int 21h
   
    lea dx, newline
    mov ah, 9
    int 21h
       
    jmp setno          
       
n: 
     
    mov ax,number
    ;mov dx,number+2
    ret
   
getno endp
   
call print_val
   
    loop1:
       
    inc cnt
   
    cmp cnt,3
    ret
    call print_val
   
print_val proc
   
     
print:          
    mov ax,cx
    mov cx,0
    mov dx,0
   
label:
   
    cmp ax,0
    je print1
    mov bx,10
    div bx
    push dx
    inc cx
    xor dx,dx
    jmp label
   
print1:
   
    cmp cx,0
    je return
    pop dx
    add dx,48
    mov ah,02
    int 21h
    dec cx
    jmp print1
    
return:    
    ret
     
endp print_val
   
   
ends

end start ; set entry point and stop the assembler.