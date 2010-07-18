module Game.Run (startGame) where

import Board.Board (board)
import Game.Logic as Game (isOver)
import Utility.FormatBoard (formatBoard)
import qualified Board.Mark as Mark
import qualified Player.MachinePlayer as MachinePlayer (play)
import qualified Player.ManPlayer as ManPlayer (play)
import qualified UI.Menu as Menu (askOrder, getMark, putGameOver, putBoard)
import qualified Utility.IO as IO (puts, gets)

makePlay mark = if mark == Mark.x
                   then ManPlayer.play
                   else MachinePlayer.play

run board mark =
    do Menu.putBoard IO.puts formatBoard board
       if Game.isOver board
          then Menu.putGameOver IO.puts
          else do (next, newBoard) <- play board mark
                  if next
                     then run newBoard (Mark.opposite mark)
                     else run board mark
               where play = makePlay mark

startGame = do run board =<< Menu.askOrder IO.gets
