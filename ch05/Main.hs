module Main where

import SimpleJSON

main = print (JObject [("foo", JNumber 1.0), ("bar", JBool True)])

-- To compile: ghc -o simple Main.hs SimpleJSON.o DOESN'T WORK, duplicate symbols
-- ghc -o simple Main.hs

-- base) ➜  ch05 git:(main) ✗ ghc -o simple Main.hs
-- [3 of 3] Linking simple
-- (base) ➜  ch05 git:(main) ✗ ./simple
-- JObject [("foo",JNumber 1.0),("bar",JBool True)]