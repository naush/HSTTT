module Utility.Benchmark where

import Algorithm.MinMax
import Board.Mark
import Data.Time

emptyBoard = [empty, empty, empty, empty, empty, empty, empty, empty, empty]

counter getBestMove emptyBoard o n =
        if n <= 0
           then do putStrLn "Time's Up."
           else do putStrLn $ "Running..." ++ (show (getBestMove emptyBoard o))
                   counter getBestMove emptyBoard o (n-1)

timer n = do t1 <- getCurrentTime
             counter getBestMove emptyBoard o n
             t2 <- getCurrentTime
             putStrLn $ "Total Running Time: " ++ (show $ t2 `diffUTCTime` t1) ++ " (n = " ++ (show n) ++ ")"
