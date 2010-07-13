module Main where

import Board.Board (board)
import Game.Run (run)
import qualified UI.Menu as Menu (startGame)

main = Menu.startGame run board
