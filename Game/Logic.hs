module Game.Logic
( wins
, isOver
, hasWon
, isValid
, playMove
) where
import Board.Board
import Board.Mark
wins = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
isOver board wins = isFull board || hasWon oMark board wins || hasWon xMark board wins
hasWon mark board wins = length [win | win <- wins, length [position | position <- win, (board !! fromIntegral position) == mark] == 3] > 0
isValid board move = elem move [0..(length board - 1)] && (board !! move) == emptyMark
