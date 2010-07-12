module Main where
import Board.Board as Board (board)
import Game.Run (run)
import Board.Mark (oMark)
main = run board oMark putStr getLine
