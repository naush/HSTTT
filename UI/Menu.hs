module UI.Menu
( getMark,
  askMove,
  askOrder,
  putGameOver,
  putBoard
) where

import Data.Char
import Utility.FormatBoard (formatBoard)
import qualified Board.Mark as Mark
import qualified Utility.IO as IO (puts, gets)

getMark choice
        | choice == "first"     = Mark.x
        | choice == "f"         = Mark.x
        | choice == "last"      = Mark.o
        | choice == "l"         = Mark.o
        | otherwise             = Mark.empty

putGameOver = IO.puts "Game Over\n"

putEnterMove = IO.puts "Enter your move (1-9) :\n"

putBoard :: [Mark.Mark] -> IO ()
putBoard board = IO.puts (formatBoard board)

putOrderQuestion = IO.puts "Play first? Last?\n"

askOrder = do putOrderQuestion
              choice <- IO.gets
              let mark = getMark (map toLower choice) in
                  if mark == Mark.empty
                     then askOrder
                     else return mark

askMove = do putEnterMove
             return =<< IO.gets
