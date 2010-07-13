module Algorithm.Evaluation 
( evaluate
) where

import Board.Board
import Game.Logic
import qualified Algorithm.Score as Score
import qualified Board.Mark as Mark

evaluate board mark wins
         | hasWon mark board wins                    = Score.win
         | hasWon (Mark.getOpposite mark) board wins = Score.lose
         | isFull board                              = Score.draw
         | otherwise                                 = Score.continue
