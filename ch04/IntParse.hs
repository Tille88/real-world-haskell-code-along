-- C code for takes string of decimal digits and turns it into an integer
-- int as_int(char *str)
-- {
--     int acc; /* accumulate the partial result */

--     for (acc = 0; isdigit(*str); str++) {
-- 	acc = acc * 10 + (*str - '0');
--     }

--     return acc;
-- }
import Data.Char (digitToInt)

loop :: Int -> String -> Int
loop acc [] = acc
loop acc (x : xs) =
  let acc' = acc * 10 + digitToInt x
   in loop acc' xs

asInt :: String -> Int
asInt xs = loop 0 xs