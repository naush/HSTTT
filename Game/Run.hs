module Game.Run (startGame) where

import Algorithm.MinMax (getBestMove)
import Board.Board (board, playMove)
import Game.Logic as Game (isOver, isValid)
import Utility.IsNumeric (isNumeric)
import qualified Board.Mark as Mark
import qualified UI.Menu as Menu (askMove, askQuestion, getMark, putGameOver, putBoard)

startGame = do choice <- Menu.askQuestion
               run board (Menu.getMark choice)

run board mark =
    let oppositeMark = Mark.getOpposite mark in
        do Menu.putBoard board
           if Game.isOver board
              then Menu.putGameOver
              else if mark == Mark.o
                      then run (playMove mark board $ getBestMove board mark) oppositeMark
                      else do input <- Menu.askMove
                              if isNumeric input && (isValid board $ read input - 1)
                                 then run (playMove mark board $ read input - 1) oppositeMark
                                 else run board mark
