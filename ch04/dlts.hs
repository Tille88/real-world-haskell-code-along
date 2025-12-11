-- ASSUMING INPUT:
-- #define DLT_EN10MB      1       /* Ethernet (10Mb) */
-- #define DLT_EN3MB       2       /* Experimental Ethernet (3Mb) */
-- #define DLT_AX25        3       /* Amateur Radio AX.25 */
-- Want to extract names such as DLT_EN10MB
import Data.List (isPrefixOf)

dlts :: String -> [String]
dlts = foldr step [] . lines
  where
    step l ds
      | "#define DLT_" `isPrefixOf` l = secondWord l : ds
      | otherwise = ds
    secondWord = head . tail . words

-- ghci> dlts "
-- ["DLT_EN10MB","DLT_EN3MB","DLT_AX25"]
-- ghci> dlts "