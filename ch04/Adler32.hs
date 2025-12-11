-- Java example:
-- public class Adler32
-- {
--     private static final int base = 65521;

--     public static int compute(byte[] data, int offset, int length)
--     {
-- 	int a = 1, b = 0;

-- 	for (int i = offset; i < offset + length; i++) {
-- 	    a = (a + (data[i] & 0xff)) % base;
-- 	    b = (a + b) % base;
-- 	}

-- 	return (b << 16) | a;
--     }
-- }

-- Haskell example:

import Data.Bits (shiftL, (.&.), (.|.))
import Data.Char (ord)

base = 65521

-- adler32 xs = helper 1 0 xs
--   where
--     helper a b (x : xs) =
--       let a' = (a + (ord x .&. 0xff)) `mod` base
--           b' = (a' + b) `mod` base
--        in helper a' b' xs
--     helper a b _ = (b `shiftL` 16) .|. a

-- Rewritten to have a pair
adler32_try2 xs = helper (1, 0) xs
  where
    helper (a, b) (x : xs) =
      let a' = (a + (ord x .&. 0xff)) `mod` base
          b' = (a' + b) `mod` base
       in helper (a', b') xs
    helper (a, b) _ = (b `shiftL` 16) .|. a

-- This is introduction to "Fold"
-- Rewritten using foldl
adler32_foldl xs =
  let (a, b) = foldl step (1, 0) xs
   in (b `shiftL` 16) .|. a
  where
    step (a, b) x =
      let a' = a + (ord x .&. 0xff)
       in (a' `mod` base, (a' + b) `mod` base)
