module UI.Menu
( getMark,
  askMove,
  askOrder,
  putEnterMove,
  putGameOver,
  putOrderQuestion,
  putBoard
) where

import Data.Char
import qualified Board.Mark as Mark
import qualified Utility.IO as IO (puts, gets)

getMark input
        | choice == "first"     = Mark.x
        | choice == "f"         = Mark.x
        | choice == "last"      = Mark.o
        | choice == "l"         = Mark.o
        | otherwise             = Mark.empty
        where choice = map toLower input

putEnterMove puts       = puts "Enter your move (1-9) :\n"
putGameOver puts        = puts "Game Over\n"
putOrderQuestion puts   = puts "Play first? Last?\n"
putBoard puts format board = puts (format board)

askOrder = do putOrderQuestion IO.puts
              input <- IO.gets
              let mark = getMark input in
                  if mark == Mark.empty
                     then askOrder
                     else return mark

askMove = do putEnterMove IO.puts
             return =<< IO.gets
