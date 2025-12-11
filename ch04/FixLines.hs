import System.Environment (getArgs)

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = mainWith myFunction
  where
    mainWith function = do
      args <- getArgs
      case args of
        [input, output] -> interactWith function input output
        _ -> putStrLn "error: exactly two arguments needed"

    -- replace "id" with the name of our function below
    myFunction = fixLines

-- Copied from SplitLines.hs
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

-- Since our function must produce a single String, we must stitch the list of lines back together.
-- The Prelude provides an unlines function that concatenates a list of strings, adding a newline to the end of each.
fixLines :: String -> String
fixLines input = unlines (splitLines input)