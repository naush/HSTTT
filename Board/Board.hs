module Board.Board
( board
, isFull
, isEmpty
, playMove
, findEmpty
, findMark
, range
) where

import Board.Mark

board   = [empty, empty, empty, empty, empty, empty, empty, empty, empty]

range   = [0..length board - 1]

isFull board = null $ findEmpty board
isEmpty board position = board !! position == empty

findEmpty board = findMark board empty
findMark board mark = [position | position <- range, board !! position == mark]

playMove mark board move = let (firstHalf, secondHalf) = splitAt move board in firstHalf ++ [mark] ++ (tail secondHalf)
