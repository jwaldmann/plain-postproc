-- | from the first line of the input, 
-- print everything after the first word (the timestamp)

{-# language OverloadedStrings #-}

module Main(main) where 


import System.Environment -- for getArgs
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T

main = do 
    args <- getArgs
    case args of
        [ outfile, benchfile ] -> do
            input <- T.readFile outfile
            let res = case T.lines input of
                    [] -> "MAYBE"
                    l : _ -> 
                        let contents = T.unwords $ drop 1 $ T.words l
                        in  if      T.isPrefixOf "YES" contents then contents
                            else if T.isPrefixOf "NO"  contents then contents
                            else "MAYBE" -- issue #1
            putStrLn $ "starexec-result=" ++ show res -- issue #2

