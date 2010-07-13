module UI.Menu
( getMark,
  askMove,
  putGameOver,
  putBoard,
  startGame
) where

import Board.Board (playMove)
import Game.Logic (isValid)
import Utility.FormatBoard (formatBoard)
import Utility.IsNumeric (isNumeric)
import qualified Board.Mark as Mark

getMark choice
        | choice == "first"     = Mark.x
        | choice == "last"      = Mark.o
        | otherwise             = Mark.x

askMove run board mark oppositeMark =
        do putEnterMove
           move <- getLine
           if (isNumeric move) && isValid board ((read move) - 1)
              then run (playMove mark board ((read move) - 1)) oppositeMark
              else run board mark

putGameOver = putStr "Game Over\n"

putEnterMove = putStr "Enter your move (1-9):\n"

putBoard board = putStr (formatBoard board)

startGame run board = do putStr "Play first? Last?\n"
                         choice <- getLine
                         run board (getMark choice)
