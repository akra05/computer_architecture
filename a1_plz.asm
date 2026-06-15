#+ BITTE NICHT MODIFIZIEREN: Vorgabeabschnitt
#+ ------------------------------------------

.data

str_address: .asciiz "address: "
str_rueckgabewert: .asciiz "\nRueckgabewert: "
buf_out: .space 256

.text

.eqv SYS_PUTSTR 4
.eqv SYS_PUTCHAR 11
.eqv SYS_PUTINT 1
.eqv SYS_EXIT 10

main:
    # Eingabe address wird ausgegeben:
    li $v0, SYS_PUTSTR
    la $a0, str_address
    syscall

    li $v0, SYS_PUTSTR
    la $a0, test_address
    syscall
    
    li $v0, SYS_PUTSTR
    la $a0, str_rueckgabewert
    syscall

    move $v0, $zero
    # Aufruf der Funktion plz:
    la $a0, test_address
    jal plz
    
    # Rueckgabewert wird ausgegeben:
    move $a0, $v0
    li $v0, SYS_PUTINT
    syscall

    # Ende der Programmausfuehrung:
    li $v0, SYS_EXIT
    syscall

    # Persoenliche Angaben zur Hausaufgabe 
    # -------------------------------------
    # Vorname:Adrian	
    # Nachname:Kraft
    # Matrikelnummer:498322
    
    # Loesungsabschnitt
    # -----------------

.data

test_address: .asciiz "81212 Konstanz Hauptbahnhof "

.text

plz:			#Register werden Initialisiert
	li $t0, 0	#$t0 = Iterationscounter
	li $t1, 0	#$t1 = Counter bis 5
	li $t2, 5
	j for  		#for Schleife wird aufgerufen
	
for:
	add $t3, $a0,$t0	# $t3 wird als n-tes Zeichen initialisiert
	lb $t3,0($t3)
	
	addi $t0,$t0,1		# Counter wird um 1 erhöht
	
	beq $t3,$zero,end_for	# if(char[t0]=='\n') beende
	j is_digit		# else: Überprüfe ob $t3 eine Zahl ist
if:
	addi $t1,$t1,1		#Counter bis 5 wird um 1 erhöht und es wird überprüft, ob der Counter bereits bei 5 ist
	beq $t1,$t2,init_result
	j for
else:
	li $t1,0	# Der Counter wird zurückgesetzt
	j for
end_for:
	li $v0,0	#Abbruch wenn Ende der Zeichenkette erreicht wurde (0 weil es dann keine Postleitzahl gibt)
	jr $ra
init_result:		#Die Speicheraddresse aus $a0 wird angepasst und Counter bzw das result Register werden initialisiert
	li $t4,0
	li $t5,0
	add $a0,$a0,$t0
	addi $a0,$a0,-5
	j result
result:				# Das Ascii Zeichen wird in einen Integer konvertiert (-48) 
	lb $t6,0($a0)		# Der Wert aus $a0 wird zu dem Register $t5 dazuaddiert
	addi $t6,$t6,-48	
	add $t5,$t5,$t6
	addi $a0,$a0,1
	addi $t4,$t4,1
	beq $t1,$t4,return	#if($t4==5) return $t5
	j mult_ten
	
mult_ten:			# Die Zahl aus $t5 wird mit 10 multipliziert 
	move $t6,$t5
	sll $t6,$t6,3		# $t6 * 8
	add $t5,$t5,$t5		# $t5 * 2
	add $t5,$t5,$t6		# result = $t6 + $t5
	j result
	
return:				# $v0 wird als die gesuchte Postleitzahl wiedergegeben 
	move $v0,$t5
	jr $ra
is_digit:
	li $t7, 48    # $t7 wird als '0' Initialisiert
	li $t8, 57    # $t8 wird als '9' Initialisiert

	blt $t3, $t7, else   #if (c < 0) gehe zu else
	bgt $t3, $t8, else   # if (c > 9) gehe zu else
	
	j if   #gehe zu if

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
