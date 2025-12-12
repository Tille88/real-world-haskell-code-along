module SimpleJSON
  ( JValue (..),
    getString,
    getInt,
    getDouble,
    getBool,
    getObject,
    getArray,
    isNull,
  )
where

-- To work with JSON data in Haskell we use an algebraic data type to represent the range of possible JSON types

data JValue
  = JString String
  | JNumber Double
  | JBool Bool
  | JNull
  | JObject [(String, JValue)]
  | JArray [JValue]
  deriving (Eq, Ord, Show)

--   We can see how to use a constructor to take a normal Haskell value and turn it into a JValue:
-- ghci> JString "foo"
-- ghci> JNumber 2.7
-- ghci> JObject [("test", JNumber 2.7), ("test2", JNull)]

-- To do the reverse, we use pattern matching.
getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _ = Nothing

-- Usage:
-- ghci> getString (JString "Hello")
-- Just "Hello"
-- ghci> getString (JNumber 3)
-- Nothing

-- More accessor functions:
getInt (JNumber n) = Just (truncate n) -- Drops the fractional part... well well
getInt _ = Nothing

getDouble (JNumber n) = Just n
getDouble _ = Nothing

getBool (JBool b) = Just b
getBool _ = Nothing

getObject (JObject o) = Just o
getObject _ = Nothing

getArray (JArray a) = Just a
getArray _ = Nothing

isNull v = v == JNull

-- Note to compile (alternatives):
-- ghc -c SimpleJSON.hs
-- ghc --make SimpleJSON.hs
-- ghc -c SimpleJSON.hs -o SimpleJSON.o