import Prelude hiding (Just)

data Maybe a = Just a | Nothing

someBool = Just True

someString = Just "Hello"

wrapped = Just (Just "wrapped")