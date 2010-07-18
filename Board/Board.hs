module Board.Board
( board
, isFull
, isEmpty
, playMove
, findEmpty
, range
) where

import Board.Mark
import Data.List

board   = [empty, empty, empty, empty, empty, empty, empty, empty, empty]

range   = [0..length board - 1]

isFull board = null $ findEmpty board
isEmpty board position = board !! position == empty

findEmpty board = elemIndices empty board

playMove mark board move = let (firstHalf, secondHalf) = splitAt move board in firstHalf ++ [mark] ++ (tail secondHalf)
