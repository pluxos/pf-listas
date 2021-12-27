import Test.Hspec        (Spec, it, describe, shouldBe, anyErrorCall, anyException, shouldThrow)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)
import Test.QuickCheck
import Control.Exception.Base

import Data.Char (isUpper,isLower,toUpper,toLower,isLetter)

import Exercise
import Exercise (combinaMetades)

valores = elements [1..13] :: Gen Int
naipes  = elements ["ouro","copas","paus","espada"] :: Gen String

main :: IO ()
main = hspecWith defaultConfig {configFastFail = False} specs

specs :: Spec
specs = do
          describe "subListaDeAte" $ do
            it "retorna string" $ do
              subListaDeAte "entrada" 2 4 `shouldBe` "trad"
            it "retorna int" $ do
              subListaDeAte [1..10] 2 4 `shouldBe` [3,4,5,6]
            it "retorna insuficiente" $ do
              subListaDeAte [1..4] 2 4 `shouldBe` [3,4]
            it "retorna vazio" $ do
              subListaDeAte ([]::[Int]) 2 4 `shouldBe` []

          describe "últimosUElementos" $ do
            it "retorna todos" $ do
              últimosUElementos [1..10] 5 `shouldBe` [6..10]
            it "retorna alguns" $ do
              últimosUElementos [1..4] 5 `shouldBe` [1..4]
            it "retorna nada" $ do
              últimosUElementos ([]::[Int]) 5 `shouldBe` []


          describe "subStringDeAteAppend" $ do
            it "retorna todos" $ do
              subStringDeAteAppend [1..10] [20..45] 3 5 `shouldBe` [4,5,6,7,8,23,24,25,26,27]
            it "retorna alguns" $ do
              subStringDeAteAppend [1..3] [20..24] 3 5 `shouldBe` [23,24]
            it "retorna alguns" $ do
              subStringDeAteAppend [1..5] [20..24] 3 5  `shouldBe` [4,5,23,24]

          describe "jogarForaAté" $ do
            it "split na virgula" $ do
              jogarForaAté "Eu quis dizer, voce nao quis escutar." ',' `shouldBe` ", voce nao quis escutar."
            it "split no z" $ do
              jogarForaAté "Eu quis dizer, voce nao quis escutar." 'z' `shouldBe` "zer, voce nao quis escutar."
            it "split no v" $ do
              jogarForaAté "Eu quis dizer, voce nao quis escutar." 'v'  `shouldBe` "voce nao quis escutar."

          describe "palíndromo" $ do
            it "retorna True" $ do
              palíndromo "ana" `shouldBe` True
            it "retorna False" $ do
              palíndromo "jose" `shouldBe` False
            it "retorna False" $ do
              palíndromo "natan foi viajar" `shouldBe` False
            it "retorna True ignorando maiúscula" $ do
              palíndromo "Natan" `shouldBe` True
            it "retorna True, ignorando símbolos " $ do
              palíndromo "Ole! Maracuja, caju, caramelo." `shouldBe` True

          describe "palíndromo genérico" $ do
            it "retorna True" $ do
              palíndromo' "ana" `shouldBe` True
            it "retorna False" $ do
              palíndromo' "jose" `shouldBe` False
            it "retorna False inteiros" $ do
              palíndromo' [1,2,3] `shouldBe` False
            it "retorna False inteiros" $ do
              palíndromo' [1,2,3,2,1] `shouldBe` True
            it "retorna True booleanos" $ do
              palíndromo' [True,False,False,True] `shouldBe` True

          describe "trim" $ do
            it "igual" $ do
              trim "Implemente uma" `shouldBe` "Implemente uma"
            it " começo e fim " $ do
              trim " Implemente uma " `shouldBe` "Implemente uma"
            it "vários espaços" $ do
              trim "  Implemente uma  " `shouldBe` "Implemente uma"

          describe "combina metades" $ do
            it "par" $ do
              combinaMetades [1,2,3,4,5,6] `shouldBe` [(1,4),(2,5),(3,6)]
            it "impar" $ do
              combinaMetades [1,2,3,4,5,6,7] `shouldBe` [(1,4),(2,5),(3,6)]

          describe "descombina metades" $ do
            it "par" $ do
              descombinaMetades [(1,4),(2,5),(3,6)] `shouldBe` [1,2,3,4,5,6]
            it "inverso" $ do
              descombinaMetades (combinaMetades [1,2,3,4,5,6]) `shouldBe` [1,2,3,4,5,6]

          describe "empacote" $ do
            it "string" $ do
              empacote "aaaabccaadeeee" `shouldBe` ["aaaa","b","cc","aa","d","eeee"]
            it "empty " $ do
              empacote "" `shouldBe` []
            it "ints" $ do
              empacote [1,1,12,2,2,3,3,3,4,4,4,3,3,3,2,2,2,1,1,1] `shouldBe` [[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3],[2,2,2],[1,1,1]]

          describe "compacte" $ do
            it "ints" $ do
              compacte [[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3],[2,2,2],[1,1,1]] `shouldBe` [(1,2),(12,1),(2,2),(3,3),(4,3),(3,3),(2,3),(1,3)]
            it "strings" $ do
              compacte ["aaaa","b","cc","aa","d","eeee"] `shouldBe` [('a',4),('b',1),('c',2),('a',2),('d',1),('e',4)]
            it "vazio" $ do
              compacte ([]::[[Int]]) `shouldBe` []

          describe "descompacte" $ do
            it "simples" $ do
              descompacte [(1,2),(12,1),(2,2),(3,3),(4,3),(3,3)] `shouldBe` [[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3]]
            it "inverso" $ do
              (let lista = [[1,1],[12],[2,2],[3,3,3],[4,4,4],[3,3,3],[2,2,2],[1,1,1]]
               in  descompacte (compacte lista) `shouldBe` lista)
            it "inverso" $ do
              (let lista = ["aaaa","b","cc","aa","d","eeee"]
               in  descompacte (compacte lista) `shouldBe` lista)

          describe "desempacote" $ do
            it "simples" $ do
              desempacote ["aaaa","b","cc","aa","d","eeee"] `shouldBe` "aaaabccaadeeee"
            it "inverso" $ do
              (let lista = "aaaabccaadeeee"
               in  desempacote (empacote lista) `shouldBe` lista)
            it "inverso" $ do
              (let lista = [1,1,12,2,2,3,3,3,4,4,4,3,3,3,2,2,2,1,1,1]
               in  desempacote (empacote lista) `shouldBe` lista)