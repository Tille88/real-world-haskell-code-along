module PrettyJSON (renderJValue) where

import Data.Bits (ShiftR, (.&.))
import Data.Char (ord)
import Numeric (showHex)
import Prettify (Doc, char, compact, double, fsep, hcat, pretty, punctuate, text, (<>))
import SimpleJSON (JValue (..))

renderJValue :: JValue -> Doc
renderJValue (JBool True) = text "true"
renderJValue (JBool False) = text "false"
renderJValue JNull = text "null"
renderJValue (JNumber num) = double num
renderJValue (JString str) = string str
renderJValue (JArray ary) = series '[' ']' renderJValue ary
renderJValue (JObject obj) = series '{' '}' field obj
  where
    field (name, val) =
      string name
        <> text ": "
        <> renderJValue val

-- Note: text, double, and string functions will be provided by our Prettify module.

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

-- enclose function simply wraps a Doc value with an opening and closing character.
enclose :: Char -> Char -> Doc -> Doc
enclose left right x = char left <> x <> char right

-- We provide a (<>) function in our pretty printing library.
-- It appends two Doc values, so it's the Doc equivalent of (++)
(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc
char c = undefined

-- hcat => concatenates multiple Doc values into one: it's the analogue of concat for lists.
hcat :: [Doc] -> Doc
hcat xs = undefined

-- oneChar => escapes or renders an individual character
oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
  Just r -> text r
  Nothing
    | mustEscape c -> hexEscape c
    | otherwise -> char c
  where
    mustEscape = c < ' ' || c == '\x7f' || c > '\xff'
    simpleEscapes :: [(Char, String)]
    simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
      where
        ch a b = (a, ['\\', b])

hexEscape :: Char -> Doc
-- hexEscape c = text ("\\u" ++ pad (showHex (ord c) "") 4)
--   where
--     pad s = if length s < 4 then '0' : pad s else s
hexEscape c
  | d < 0x10000 = smallHex d
  | otherwise = astral (d - 0x10000)
  where
    d = ord c

-- Show a value in hexadecimal, and pad it to 4 digits.
showHex :: (Integral a) => a -> ShowS
showHex n showVal =
  case showIntAtBase 16 intToDigit n "" of
    [] -> "0"
    s -> s

smallHex :: Int -> Doc
smallHex x =
  text "\\u"
    <> text (replicate (4 - length h) '0')
    <> text h
  where
    h = showHex x ""

astral :: Int -> Doc
astral n = smallHex (a + 0xd800) <> smallHex (b + 0xdc00)
  where
    a = (n `shiftR` 10) .&. 0x3ff
    b = n .&. 0x3ff

-- helper for arrays/objects
series :: Char -> Char -> (a -> Doc) -> [a] -> Doc
-- takes an opening and closing character, then a function that knows how to pretty print a value of some unknown type a, followed by a list of values of type a, and it returns a value of type Doc
series open close item = enclose open close . fsep . puncuate (char ',') . map item