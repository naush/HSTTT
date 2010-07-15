module Game.Run (run) where

import Algorithm.MinMax (getBestMove)
import Board.Board (board, playMove)
import Game.Logic as Game (isOver)
import qualified Board.Mark as Mark
import qualified UI.Menu as Menu (askMove, putGameOver, putBoard)

run board mark =
    let oppositeMark = Mark.getOpposite mark in
        do Menu.putBoard board
           if Game.isOver board
              then Menu.putGameOver
              else if mark == Mark.o
                      then run (playMove mark board (getBestMove board mark)) oppositeMark
                      else Menu.askMove run board mark oppositeMark
