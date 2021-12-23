import Test.Hspec        (Spec, it, describe, shouldBe, anyErrorCall, anyException, shouldThrow)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)
import Test.QuickCheck
import Control.Exception.Base

import Data.Char (isUpper,isLower,toUpper,toLower,isLetter)

import Exercise

valores = elements [1..13] :: Gen Int
naipes  = elements ["ouro","copas","paus","espada"] :: Gen String

main :: IO ()
main = hspecWith defaultConfig {configFastFail = False} specs

specs :: Spec
specs = do
          describe "Naipe" $ do
            it "retorna o segundo elemento" $ property $
              forAll naipes
                (\x ->
                  naipe (3,x) == x)

          describe "Valor" $ do
            it "retorna o primeiro elemento" $ property $
              forAll valores
                (\x ->
                  valor (x,"_") == x)

          describe "cartaÉMenor" $ do
            it "menor" $ do
              cartaÉMenor (1,"ouro") (2,"ouro") `shouldBe` True
            it "menor" $ do
              cartaÉMenor (2,"copas") (2,"ouro") `shouldBe` True
            it "igual" $ do
              cartaÉMenor (1,"ouro") (1,"ouro") `shouldBe` False
            it "igual" $ do
              cartaÉMenor (2,"copas") (2,"copas") `shouldBe` False
            it "maior" $ do
              cartaÉMenor (2,"ouro") (1,"ouro") `shouldBe` False
            it "maior" $ do
              cartaÉMenor (2,"ouro") (2,"copas") `shouldBe` False

          describe "cartaÉIgual" $ do
            it "menor" $ do
              cartaÉIgual (1,"ouro") (2,"ouro") `shouldBe` False
            it "menor" $ do
              cartaÉIgual (2,"copas") (2,"ouro") `shouldBe` False
            it "igual" $ do
              cartaÉIgual (1,"ouro") (1,"ouro") `shouldBe` True
            it "igual" $ do
              cartaÉIgual (2,"copas") (2,"copas") `shouldBe` True
            it "maior" $ do
              cartaÉIgual (2,"ouro") (1,"ouro") `shouldBe` False
            it "maior" $ do
              cartaÉIgual (2,"ouro") (2,"copas") `shouldBe` False

          describe "cartaÉMaior" $ do
            it "menor" $ do
              cartaÉMaior (1,"ouro") (2,"ouro") `shouldBe` False
            it "menor" $ do
              cartaÉMaior (2,"copas") (2,"ouro") `shouldBe` False
            it "igual" $ do
              cartaÉMaior (1,"ouro") (1,"ouro") `shouldBe` False
            it "igual" $ do
              cartaÉMaior (2,"copas") (2,"copas") `shouldBe` False
            it "maior" $ do
              cartaÉMaior (2,"ouro") (1,"ouro") `shouldBe` True
            it "maior" $ do
              cartaÉMaior (2,"ouro") (2,"copas") `shouldBe` True

          describe "ordenaCartas" $ do
            it "mesmo naipe" $ do
              ordenaCartas (1,"ouro") (2,"ouro") (3,"ouro") `shouldBe` ((3,"ouro"),(2,"ouro"),(1,"ouro"))
            it "mesmo naipe" $ do
              ordenaCartas (2,"ouro") (1,"ouro") (3,"ouro") `shouldBe` ((3,"ouro"),(2,"ouro"),(1,"ouro"))
            it "mesmo naipe" $ do
              ordenaCartas (3,"ouro") (1,"ouro") (2,"ouro") `shouldBe` ((3,"ouro"),(2,"ouro"),(1,"ouro"))
            it "mesmo naipe" $ do
              ordenaCartas (3,"ouro") (2,"ouro") (1,"ouro") `shouldBe` ((3,"ouro"),(2,"ouro"),(1,"ouro"))

            it "mesmo valor" $ do
              ordenaCartas (1,"ouro") (1,"copas") (1,"espada") `shouldBe` ((1,"ouro"),(1,"espada"),(1,"copas"))
            it "mesmo valor" $ do
              ordenaCartas (1,"copas") (1,"ouro") (1,"espada") `shouldBe` ((1,"ouro"),(1,"espada"),(1,"copas"))
            it "mesmo valor" $ do
              ordenaCartas (1,"espada") (1,"copas") (1,"ouro") `shouldBe` ((1,"ouro"),(1,"espada"),(1,"copas"))

            it "empate" $ do
              ordenaCartas (1,"ouro") (1,"ouro") (1,"ouro") `shouldBe` ((1,"ouro"),(1,"ouro"),(1,"ouro"))

            it "empate" $ do
              ordenaCartas (1,"ouro") (1,"ouro") (1,"espada") `shouldBe` ((1,"ouro"),(1,"ouro"),(1,"espada"))
            it "empate" $ do
              ordenaCartas (1,"ouro") (1,"espada") (1,"ouro") `shouldBe` ((1,"ouro"),(1,"ouro"),(1,"espada"))
            it "empate" $ do
              ordenaCartas (1,"espada") (1,"ouro") (1,"ouro") `shouldBe` ((1,"ouro"),(1,"ouro"),(1,"espada"))


          describe "éJogo" $ do
            it "mesmo naipe" $ do
              éJogo ((3,"ouro"), (2,"ouro"), (1,"ouro")) `shouldBe` True
            it "mesmo valor" $ do
              éJogo  ((1,"ouro"), (1,"copas"), (1,"espada")) `shouldBe` True
            it "não é jogo" $ do
              éJogo ((3,"ouro"), (2,"espada"), (1,"ouro")) `shouldBe` False

          describe "maiorMão" $ do
            it "primeira (um jogo)" $ do
              (let m1 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
                   m2 = ((2,"ouro"),(2,"ouro"),(1,"ouro"))
               in maiorMão m1 m2 `shouldBe` m1)
            it "primeira (dois jogo)" $ do
              (let m1 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
                   m2 = ((3,"espada"),(2,"espada"),(1,"espada"))
               in maiorMão m1 m2 `shouldBe` m1)
            it "primeira (0 jogo)" $ do
              (let m1 = ((3,"ouro"),(2,"ouro"),(1,"paus"))
                   m2 = ((3,"espada"),(2,"ouro"),(1,"espada"))
               in maiorMão m1 m2 `shouldBe` m1)
            it "segunda (um jogo)" $ do
              (let m1 = ((2,"ouro"),(2,"ouro"),(1,"ouro"))
                   m2 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
               in maiorMão m1 m2 `shouldBe` m2)
            it "segunda (dois jogo)" $ do
              (let m1 = ((3,"espada"),(2,"espada"),(1,"espada"))
                   m2 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
               in maiorMão m1 m2 `shouldBe` m2)
            it "segunda (0 jogo)" $ do
              (let m1 = ((3,"espada"),(2,"ouro"),(1,"espada"))
                   m2 = ((3,"ouro"),(2,"ouro"),(1,"paus"))
               in maiorMão m1 m2 `shouldBe` m2)

          describe "mãoGanhadora" $ do
            it "primeira (um jogo)" $ do
              (let m1 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
                   m2 = ((2,"ouro"),(2,"ouro"),(1,"ouro"))
               in mãoGanhadora m1 m2 `shouldBe` m1)
            it "primeira (dois jogo)" $ do
              (let m1 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
                   m2 = ((3,"espada"),(2,"espada"),(1,"espada"))
               in mãoGanhadora m1 m2 `shouldBe` m1)
            it "primeira (0 jogo)" $ do
              (let m1 = ((3,"ouro"),(2,"ouro"),(1,"paus"))
                   m2 = ((3,"espada"),(2,"ouro"),(1,"espada"))
               in mãoGanhadora m1 m2 `shouldBe` m1)
            it "segunda (um jogo)" $ do
              (let m1 = ((2,"ouro"),(2,"ouro"),(1,"ouro"))
                   m2 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
               in mãoGanhadora m1 m2 `shouldBe` m2)
            it "segunda (dois jogo)" $ do
              (let m1 = ((3,"espada"),(2,"espada"),(1,"espada"))
                   m2 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
               in mãoGanhadora m1 m2 `shouldBe` m2)
            it "segunda (0 jogo)" $ do
              (let m1 = ((3,"espada"),(2,"ouro"),(1,"espada"))
                   m2 = ((3,"ouro"),(2,"ouro"),(1,"paus"))
               in mãoGanhadora m1 m2 `shouldBe` m2)

            it "empate" $ do
              (let m1 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
                   m2 = ((3,"ouro"),(2,"ouro"),(1,"ouro"))
                   em = ((0,""),(0,""),(0,""))
               in mãoGanhadora m1 m2 `shouldBe` em)