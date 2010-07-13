module Board.Board
( board
, isFull
, playMove
) where

import qualified Board.Mark as Mark

board = "+++++++++"
isFull board = null [position | position <- board, position == Mark.empty]
playMove mark board move = let (firstHalf, secondHalf) = splitAt move board in firstHalf ++ [mark] ++ (tail secondHalf)
