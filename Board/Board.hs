module Board.Board
( board
, isFull
, playMove
) where
import Board.Mark
board = "+++++++++"
isFull board = null [position | position <- board, position == emptyMark]
playMove mark board move = let (firstBoard, secondBoard) = splitAt move board in firstBoard ++ [mark] ++ (tail secondBoard)
