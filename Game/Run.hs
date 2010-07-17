module Game.Run (startGame) where

import Board.Board (board)
import Game.Logic as Game (isOver)
import Utility.FormatBoard (formatBoard)
import qualified Board.Mark as Mark
import qualified Player.MachinePlayer as MachinePlayer (play)
import qualified Player.ManPlayer as ManPlayer (play)
import qualified UI.Menu as Menu (askOrder, getMark, putGameOver, putBoard)
import qualified Utility.IO as IO (puts)

startGame = do run board =<< Menu.askOrder

makeMove board mark =
         if mark == Mark.o
            then MachinePlayer.play run board mark
            else ManPlayer.play run board mark

run board mark =
    do Menu.putBoard IO.puts formatBoard board
       if Game.isOver board
          then Menu.putGameOver IO.puts
          else makeMove board mark
