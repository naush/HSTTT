module UI.Menu
( getMark,
  askMove,
  askQuestion,
  putGameOver,
  putBoard
) where

import Utility.FormatBoard (formatBoard)
import qualified Board.Mark as Mark
import qualified Utility.IO as IO (puts, gets)

getMark choice
        | choice == "first"     = Mark.x
        | choice == "last"      = Mark.o
        | otherwise             = Mark.x

putGameOver = IO.puts "Game Over\n"

putEnterMove = IO.puts "Enter your move (1-9) :\n"

putBoard board = IO.puts (formatBoard board)

putQuestion = IO.puts "Play first? Last?\n"

askQuestion = do putQuestion
                 return =<< IO.gets

askMove = do putEnterMove
             return =<< IO.gets
