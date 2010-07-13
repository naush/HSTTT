module Algorithm.Evaluation 
( evaluate
) where

import Board.Board
import qualified Board.Mark as Mark
import Game.Logic

evaluate board mark wins
         | hasWon mark board wins                    =  1
         | hasWon (Mark.getOpposite mark) board wins = -1
         | isFull board                              =  0
         | otherwise                                 =  2
