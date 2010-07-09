module Board.Board (
        board,
        isFull,
        playMove,
        getOppositeMark) where
board = "+++++++++"
isFull :: [Char] -> Bool
isFull board = null [position | position <- board, position == '+']
playMove :: Char -> [Char] -> Int -> [Char]
playMove mark board move = let (firstBoard, secondBoard) = splitAt move board in firstBoard ++ [mark] ++ (tail secondBoard)
getOppositeMark :: Char -> Char
getOppositeMark mark = if mark == 'O' then 'X' else 'O'
