module Algorithm.Evaluation 
( evaluate
) where

import Board.Board
import Game.Logic
import qualified Algorithm.Score as Score
import qualified Board.Mark as Mark

evaluate board mark
         | hasWon mark board                    = Score.win
         | hasWon (Mark.opposite mark) board    = Score.lose
         | isFull board                         = Score.draw
         | otherwise                            = Score.continue
