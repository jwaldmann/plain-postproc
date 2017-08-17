{-

"stdout" from star-exec now looks like this:

/export/starexec/sandbox/solver/bin/starexec_run_certified /export/starexec/sandbox/benchmark/theBenchmark.xml /export/starexec/sandbox/output/output_files


--------------------------------------------------------------------------------


YES
...


We want to throw away everything up to, and including, the line of 80 dashes,
and then get the first (non-white) line.

-}


{-# language OverloadedStrings #-}

module Main(main) where 


import System.Environment -- for getArgs
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T
import Data.Char (isSpace)

main = do 
    args <- getArgs
    case args of
        [ outfile, benchfile, extradir ] -> do
            input <- T.readFile outfile
            let separator = T.replicate 80 "-"
                res = case dropWhile (/= separator) $ T.lines input of
                        [] -> "MAYBE"
                        _ : ls -> case dropWhile (T.all isSpace) ls of
                           [] -> "MAYBE"
                           contents : _ -> 
                             if      T.isPrefixOf "YES" contents then contents
                             else if T.isPrefixOf "NO"  contents then contents
                             else if T.isPrefixOf "WORST_CASE" contents then contents
                             else "MAYBE" -- issue #1
            putStrLn $ unlines [ "starexec-result=" ++ show res -- issue #2
                               , "output-size=" ++ show (T.length input)
                               ]

