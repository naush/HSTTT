module Main where
import Utility.IsNumeric
import Utility.FormatBoard
import Algorithm.MinMax
import Board.Board
import Game.Logic
play :: [Char] -> Char -> IO ()
play board mark
        | gameOver      = do putStr (formatBoard board)
                             putStrLn "Game Over"
        | mark == 'O'   = do putStr (formatBoard board)
                             play (playMove mark board (getBestMove board mark)) (getOppositeMark mark)
        | mark == 'X'   = do putStr (formatBoard board)
                             move <- getLine
                             if (isNumeric move) && isValid board (read move)
                               then play (playMove mark board (read move)) (getOppositeMark mark)
                               else play board mark
        where gameOver = isOver board wins
main = play board 'O'
