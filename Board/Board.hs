module Board.Board
( board
, isFull
, isEmpty
, playMove
, findEmpty
, findMark
, length
, range
) where

import Prelude hiding (length)
import qualified Board.Mark as Mark

board   = "+++++++++"
length  = 8 :: Int
range   = [0..length]

isFull board = null (findEmpty board)
playMove mark board move = let (firstHalf, secondHalf) = splitAt move board in firstHalf ++ [mark] ++ (tail secondHalf)
findEmpty board = findMark board Mark.empty
findMark board mark = [position | position <- range, board !! position == mark]
isEmpty board position = (board !! position) == Mark.empty
