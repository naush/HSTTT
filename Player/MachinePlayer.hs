module Player.MachinePlayer (play) where

import Algorithm.MinMax (getBestMove)
import Board.Board (playMove)
import qualified Board.Mark as Mark

play board mark = return (True, playMove mark board $ getBestMove board mark)
