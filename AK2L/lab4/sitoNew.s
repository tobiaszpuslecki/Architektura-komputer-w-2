.data
STDOUT = 1
SYSWRITE = 1
SYSEXIT = 60
EXIT_SUCCESS = 0
ILOSC_LICZB = 9999    # Ilość liczb jakie sprawdzić ma algorytm.

 
.bss
.comm sito_bufor, 9999 # Bufor wartości 0/1 decydujących czy dana
                       # liczba (indeks+2) jest liczbą pierwszą
                       # czy nie. Jego rozmiar to ilość liczb
                       # do wygenerowanie-2.

.text
.globl _start
 
_start:

 

 
# Czyszczenie sita w pętli
mov $ILOSC_LICZB, %edi
sito_petla1:
    dec %edi
    movb $1, sito_bufor(, %edi, 1)
cmp $0, %edi
jg sito_petla1


 
# Pętla wykonująca się dla każdej liczby z sita
# [ for(i=2; i<$ILOSC_LICZB+2; i++) ]

mov $0, %edi # Licznik indeksów w buforze sita
             # - od 0 do $ILOSC_LICZB.
mov $2, %esi # Licznik wartości elementów odpowiadających
             # indeksom w buforze sita. Dla pierwszego elementu
             # z bufora tj. o indeksie 0, wartością będzie 2,
             # ponieważ w obliczeniach pomijamy liczby 0 i 1.



########

sito_petla2:
    # Jeśli aktualna liczba nie jest liczbą pierwszą przechodzimy
    # do kolejnego wykonania pętli.
    # [ if(sito[i-2] == 0) continue; ]
    
    mov sito_bufor(, %edi, 1), %eax
    bt %edi, %eax
    

    je sito_pomin2
 

 
    # Oznaczenie wielokrotności wybranej liczby w buforze -> 0
    # [ for(j=i; j<$ILOSC_LICZB+2; j+=i) ]
    mov %rdi, %r8 # Licznik indeksów w buforze sita
                  # - od (i-2) do $ILOSC_LICZB.
    mov %rsi, %r9 # Licznik wartości - od i do $ILOSC_LICZB+2.
    sito_petla3:

        btr %edi, %eax


    add %rsi, %r8
    add %rsi, %r9
    cmp $ILOSC_LICZB, %r8
    jl sito_petla3
 
    sito_pomin2:

inc %edi
inc %esi
cmp $ILOSC_LICZB, %edi
jl sito_petla2
 

#########


 
# Wyświetlenie bufora
mov $SYSWRITE, %eax
mov $STDOUT, %edi
mov $sito_bufor, %esi
mov $9999, %edx
int $0x80
 
 
 

mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %edi
int $0x80