module Exercise where
import Data.Char (isLetter, toLower)
import Data.List (group)

-- Defina as seguintes funções sem usar recursão.

{-
Defina uma função que retorne a sub-lista com t elementos começando na posição i da lista dada.

Entrada:
    - l: lista 
    - i: inteiro com posição inicial da sub-lista
    - t: inteiro com tamanho da sub-lista.

>>> subListaDeAte "entrada" 2 4
"trad"

>>> subListaDeAte [1..10] 2 4
[3,4,5,6]

>>> subListaDeAte [1..4] 2 4
[3,4]

>>> subListaDeAte [] 2 4
[]

-}
subListaDeAte l i t = undefined 



{-
Defina uma função que retorne a sub-lista com os últimos u elementos da lista de entrada.

Entrada:
    - l: lista
    - u: inteiro com a quantidade de elementos da sub-lista que termina a string de entrada.

>>> últimosUElementos [1..10] 5
[6,7,8,9,10]

>>> últimosUElementos [1..4] 5
[1,2,3,4]

>>> últimosUElementos [] 5
[]

-}
últimosUElementos l u = undefined 

{-
Defina uma função que receba duas listas e retorne a resultado da concatenação das listas de t elementos começando na posição i das listas de entrada.

Entrada
    - l1: lista
    - l2: lista
    - i: inteiro com posição de início das sub-listas.
    - t: inteiro com tamanho das sub-listas.

>>> subStringDeAteAppend [1..10] [20..45] 3 5
[4,5,6,7,8,23,24,25,26,27]

>>> subStringDeAteAppend [1..3] [20..24] 3 5 
[23,24]

>>> subStringDeAteAppend [1..5] [20..24] 3 5 
[4,5,23,24]
-}

subStringDeAteAppend l1 l2 i u = undefined 



{-
Defina uma função que jogue fora os elementos inicias de uma lista s até que o restante da lista se inicie com um elemento c ou que a lista termine.

Entrada:
    - l: lista
    - e: elemento do mesmo tipo.

Resultado: 
    - a string resultante.

Exemplos:
>>>jogarForaAté "Eu quis dizer, voce nao quis escutar." ','
", voce nao quis escutar."

>>>jogarForaAté "Eu quis dizer, voce nao quis escutar." 'z'
"zer, voce nao quis escutar."

>>>jogarForaAté "Eu quis dizer, voce nao quis escutar." 'v'
"voce nao quis escutar."

-}

jogarForaAté l e = undefined 



{-
Um palíndromo é uma palavra que pode ser lida da esquerda para a direita ou da direita para a esquerda com o mesmo resultado, como por exemplo, ovo e Natan.
O conceito pode ser estendido para frases se ignorarmos espaços, acentos e sinais de pontuação, por exemplo, "Olé! Maracujá, caju, caramelo.".

Escreva uma função que teste se a entrada é um palíndromo.
Assuma que a entrada não tem acentos ou pontuações e que ou todas as letras são maiúsculas ou todas são minúsculas.

Use isLetter e filter para ignorar o que não for letra.
Somente caracteres não acentuados foram usados.

Entrada:
    - s - String

Resultado: 
    - True se s é um palíndromo; False caso contrário.

Exemplos:
>>>palíndromo "ana"
True
>>>palíndromo "jose"
False

>>>palíndromo "natan foi viajar"
False

>>>palíndromo "natan"
True

>>> palíndromo "Ole! Maracuja, caju, caramelo."
True
-}

palíndromo :: String -> Bool
palíndromo s = undefined 


{-
O conceito de palíndromo pode ser aplicado a qualquer lista, por exemplo de inteiros. Neste caso, [1,2,3,4,5,4,3,2,1] seria um palíndromo.
Escreva uma função que teste se uma lista qualquer é um palíndromo.

Entrada:
    - s - lista de "qualquer" coisa.

Resultado: 
    - True se s é uma lista palíndroma; False caso contrário.

Exemplos:
>>>palíndromo' "ana"
True
>>>palíndromo' "jose"
False

>>>palíndromo' [1,2,3]
False

>>>palíndromo' [True,False,False,True]
True

-}

palíndromo' s = undefined 


{-
Frequentemente precisamos limpar dados entrados por usuários em fomulários.
Por exemplo, precisamos tirar os espaços no início e fim dos dados digitados, como em " José de Abreu  "
Algumas linguagens tem uma função trim que remove tais espaços em branco.

Implemente uma função que elimine todos os espaços em branco no início e fim de uma string.

>>>trim "Implemente uma"
"Implemente uma"

>>>trim " Implemente uma "
"Implemente uma"

>>>trim "  Implemente uma  "
"Implemente uma"

>>>trim "   Implemente uma"
"Implemente uma"

>>>trim "Implemente uma   "
"Implemente uma"
-}

trim :: String -> String
trim s = undefined 


{-
Escreva uma função que retorne duplas formadas pelos por elementos das duas metades da lista, sendo o primeiro elemento do resultado formado pelo 
primeiro elemento da primeira metade da lista mais o primeiro da segunda metade da lista, o segundo elemento formado pelo segundo elemento da primeira
metade mais o segundo elemento da segunda metade e assim por diante.

Dica: splitAt e length

>>>combinaMetades [1,2,3,4,5,6]
[(1,4),(2,5),(3,6)]

>>>combinaMetades [1,2,3,4,5,6,7]
[(1,4),(2,5),(3,6)]

-}

combinaMetades l = undefined 

{-
Escreva uma função que reverta combinaMetades. Ou seja
>>>descombinaMetades [(1,4),(2,5),(3,6)] 
[1,2,3,4,5,6]
-}
descombinaMetades l = undefined 





{-
Escreva uma função que separe repetições consecutivas dentro de uma lista.

Dica: investigue a função group.

>>>empacote "aaaabccaadeeee"
["aaaa","b","cc","aa","d","eeee"]

>>>empacote ""
[]


>>>empacote [1,1,12,2,2,3,3,3,4,4,4,3,3,3,2,2,2,1,1,1]
[[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3],[2,2,2],[1,1,1]]

-}

empacote :: (Eq a) => [a] -> [[a]]
empacote l = undefined 


{-
Dado uma lista empacotada, como a gerada pela função anterior, gere uma lista de duplas tal que:
- para cada pacote haja uma dupla no resultado.
- a dupla tem como primeiro elemento o dado repetido na lista correspondente e como segundo elemento o comprimento de tal lista.

>>>compacte [[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3],[2,2,2],[1,1,1]]
[(1,2),(12,1),(2,2),(3,3),(4,3),(3,3),(2,3),(1,3)]

>>>compacte ["aaaa","b","cc","aa","d","eeee"]
[('a',4),('b',1),('c',2),('a',2),('d',1),('e',4)]

>>>compacte []
[]

>>>compacte [[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3]]
[(1,2),(12,1),(2,2),(3,3),(4,3),(3,3)]

-}
compacte l = undefined 


{-
Escreva uma função que reverta a função compacte, definida acima, ou seja, tal que
>>>descompacte (compacte [[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3]]) == [[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3]]
True

>>> descompacte [(1,2),(12,1),(2,2),(3,3),(4,3),(3,3)]
[[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3]]


Dica: use replicate

-}

descompacte l = undefined 


{-
Escreva uma função que reverta a função empacote, acima, definida acima, ou seja, tal que
>>>desempacote (empacote "aaaabccaadeeee") == "aaaabccaadeeee"
True

>>> desempacote ["aaaa","b","cc","aa","d","eeee"]
"aaaabccaadeeee"

-}

desempacote l = undefined 
