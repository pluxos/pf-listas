module Exercise where

-- Defina as seguintes funções usando tuplas. Inclua os tipos para todas as funções definidas.

{-
Convencionemos que uma carta de baralho é uma tupla em que 
 - o primeiro elemento é o valor da carta (1,2,3,4,5,6,7,8,9,10,11,12,13)
 - o segundo é o naipe ("ouro", "copas", "espada", "paus").
-}

{-
Uma função que receba uma carta retorne seu naipe.

Entrada:
    - c1: carta

Resultado: naipe da carta
-}
naipe :: (Int,String) -> String
naipe c1 = undefined 

{-
Uma função que receba uma carta retorne seu valor.

Entrada:
    - c1: carta

Resultado: valor da carta
-}
valor :: (Int,String) -> Int
valor c1 = undefined 


{-
Uma função que receba duas cartas e diga se a primeira é menor que a segunda.
Uma carta c1 é menor que uma carta c2 se valor c1 < valor2 OU se valor c1 == valor c2 e naipe c1 < c2.
"copas" < "espada" < "ouro" < "paus"

Entrada:
    - c1, c2: cartas
Resultado: True ou False
-}

cartaÉMenor c1 c2 = undefined 

{-
Uma função que receba duas cartas e diga se a primeira é igual à segunda.

Entrada:
    - c1, c2: cartas
Resultado: True ou False
-}

cartaÉIgual c1 c2 = undefined 

{-
Uma função que receba duas cartas e diga se a primeira é maior que a segunda.

Entrada:
    - c1, c2: cartas
Resultado: True ou False
-}
cartaÉMaior c1 c2 = undefined 


{-
Uma função que recebe 3 cartas c1 c2 c3 e retorne uma tripla com c2 c2 e c3, em ordem decrescente.
-}
ordenaCartas c1 c2 c3 = undefined 


{-
Uma função que receba uma tupla de 3 cartas, m1 m2 m3, ordenadas de forma decrescente, e diga se formam um jogo, onde,
m1 m2 e m3 formam um jogo se e somente se
    - OU naipe m1 == naipe m2 == naipe m3 E valor m1 == valor m2 + 1 == valor m3 + 2
    - OU naipe m1 =/= naipe m2 =/= naipe m3 =/= m1 E valor m1 == valor m2 == valor m3

Entrada:
    - (m1, m2, m3): cartas
Resultado: True ou False
-}
éJogo c1 c2 c3 = undefined 

{-
Defina uma função que receba duas tuplas de 3 cartas ordenadas de forma decrescente, compare as tuplas, e retorne a maior dentre as duas tuplas.
Uma tupla t1 é menor que uma tupla t2 se e somente se
- a primeira carta de t1 é menor que a primeira de t2 OU
- as primeiras cartas são iguais mas a segunda carta de t1 é menor que a segunda de t2
- as primeiras e segundas cartas são iguais mas a terceira carta de t1 é menor que a terceira de t2
-}
maiorMão t1 t2 = undefined 

{-
Defina uma função que receba duas tuplas de 3 cartas ordenadas de forma decrescente, e compare as tuplas para dizer qual ganha, ou se houve empate.
Uma tupla t1 ganha de uma tupla t2 se 
- t1 é um jogo mas t2 não é um jogo
- t1 e t2 são um jogo mas t1 é maior que t2.
- se nenhuma é jogo e t1 é maior que t2
- No caso de empate, retorne a tupla ((0,""),(0,""),(0,""))
-}

mãoGanhadora tupla1 tupla2 = undefined