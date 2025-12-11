splitLines :: String -> [String]
-- Our function's type signature indicates that it accepts a single string,
-- the contents of a file with some unknown line ending convention.
-- It returns a list of strings, representing each line from the file.
splitLines [] = []
splitLines cs =
  let (pre, suf) = break isLineTerminator cs
   in pre : case suf of
        ('\r' : '\n' : rest) -> splitLines rest
        ('\r' : rest) -> splitLines rest
        ('\n' : rest) -> splitLines rest
        _ -> []

isLineTerminator :: Char -> Bool
isLineTerminator c = c == '\r' || c == '\n'
