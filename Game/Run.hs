module Game.Run (startGame) where

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

run (board, mark) =
    do Menu.putBoard IO.puts formatBoard board
       if Game.isOver board
          then Menu.putGameOver IO.puts
          else do run =<< play board mark
               where play = makePlay mark

startGame = do run =<< Menu.askOrder IO.gets
