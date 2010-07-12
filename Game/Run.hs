module Game.Run (run) where
import Utility.IsNumeric (isNumeric)
import Utility.FormatBoard (formatBoard)
import Algorithm.MinMax (getBestMove)
import Board.Board as Board (board, playMove)
import Board.Mark
import Game.Logic as Game (isValid, isOver, wins)
askMove run board mark oppositeMark puts gets =
        do puts "Enter your move (0-8):\n"
           move <- gets
           if (isNumeric move) && isValid board (read move)
              then run (playMove mark board (read move)) oppositeMark puts gets
              else run board mark puts gets
run board mark puts gets =
    let gameOver = isOver board wins in
    let oppositeMark = getOppositeMark mark in
        do puts (formatBoard board)
           if gameOver == True
              then puts "Game Over\n"
              else if mark == oMark
                      then run (playMove mark board (getBestMove board mark)) oppositeMark puts gets
                      else askMove run board mark oppositeMark puts gets
