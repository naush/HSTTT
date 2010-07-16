module Game.Run (startGame) where

import Board.Board (board)
import Game.Logic as Game (isOver)
import qualified Board.Mark as Mark
import qualified Player.MachinePlayer as MachinePlayer (play)
import qualified Player.ManPlayer as ManPlayer (play)
import qualified UI.Menu as Menu (askOrder, getMark, putGameOver, putBoard)

startGame = do run board =<< Menu.askOrder

makeMove board mark =
         if mark == Mark.o
            then MachinePlayer.play run board mark
            else ManPlayer.play run board mark

run board mark =
    do Menu.putBoard board
       if Game.isOver board
          then Menu.putGameOver
          else makeMove board mark
