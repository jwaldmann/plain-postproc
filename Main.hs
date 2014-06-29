-- | from the first line of the input, 
-- print everything after the first word (the timestamp)

module Main(main) where 

import System.Environment -- for getArgs
import System.IO -- for file reading

main = do 
    args <- getArgs
    case args of
        [ outfile, benchfile ] -> do
            input <- readFile outfile
            let res = case lines input of
                    [] -> "MAYBE"
                    l : _ -> concat $ drop 1 $ words l
            putStrLn $ "starexec-result=" ++ res 

