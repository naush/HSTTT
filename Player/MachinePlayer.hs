module Player.MachinePlayer (play) where

import Algorithm.MinMax (getBestMove)
import Board.Board (playMove)
import qualified Board.Mark as Mark

play board mark = return (playMove mark board $ getBestMove board mark, Mark.opposite mark)
