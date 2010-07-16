module Game.Logic
( aWinner
, hasWon
, hasWonAny
, isOver
, isValid
, wins
) where

import qualified Board.Board as Board
import qualified Board.Mark as Mark

wins = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

isOver board = Board.isFull board || hasWon Mark.o board || hasWon Mark.x board

aWinner [] mark board = True
aWinner win mark board =
        let position:ps = win in
            if board !! position == mark then aWinner ps mark board else False

hasWonAny mark board [] = False
hasWonAny mark board wins =
          let win:ws = wins in
          if  aWinner win mark board
              then True
              else hasWonAny mark board ws

hasWon mark board = hasWonAny mark board wins

isValid board move = elem move Board.range && Board.isEmpty board move
