module Main where
--import Board.Board
board = "+++++++++"
wins = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
isFull board = null [position | position <- board, position == '+']
isOver mark board wins = length [win | win <- wins, length [position | position <- win, (board !! fromIntegral position) == mark] == 3] > 0
isValid board move = elem move [0..(length board - 1)] && (board !! move) == '+'
formatBoard board = [ board !! 0, board !! 1, board !! 2, '\n',
                      board !! 3, board !! 4, board !! 5, '\n',
                      board !! 6, board !! 7, board !! 8, '\n' ]
playMove mark board move = let (firstBoard, secondBoard) = splitAt move board in firstBoard ++ [mark] ++ (tail secondBoard)
getOppositeMark mark = if mark == 'O' then 'X' else 'O'
-- evaluateBoard (playMove 'O' (playMove 'O' (playMove 'O' board 2) 1) 0) 'O' wins
-- getScoreBoard 'X' wins (playMove 'O' board 0)
getMiniMaxScore mark wins board = let score = evaluateBoard board mark wins in
                                    if score < 2
                                      then score
                                      else minimum (map negate (map (getMiniMaxScore (getOppositeMark mark) wins) (map (playMove (getOppositeMark mark) board) [empty | empty <- [0..length board-1], (board !! empty) == '+'])))
evaluateBoard board mark wins
        | isOver mark board wins                   =  1
        | isOver (getOppositeMark mark) board wins = -1
        | isFull board                             =  0
        | otherwise                                =  2
-- getBestMove board mark = getNextAvailableMove board 0
-- getScoreBoard mark wins board = map (getMiniMaxScore mark wins) (map (playMove mark board) [empty | empty <- [0..length board-1], (board !! empty) == '+'])
getScoreBoard mark wins board = [ if (board !! x) == '+' then getMiniMaxScore mark wins (playMove mark board x) else -2 | x <- [0..length board-1] ]
getBestMove board mark = let scoreBoard = (getScoreBoard 'O' wins board) in
                         let bestScore = maximum scoreBoard in (head [move | move <- [0..length scoreBoard-1], (scoreBoard !! move) == bestScore ])
getNextAvailableMove (first:rest) position = if (first == '+') then position else getNextAvailableMove rest (position+1)
play board mark = if isFull board || isOver 'O' board wins || isOver 'X' board wins
                    then do
                      putStr (formatBoard board)
                      putStrLn "Game Over"
                    else do
                      putStr (formatBoard board)
                      if mark == 'O'
                        then play (playMove mark board (getBestMove board mark)) (getOppositeMark mark)
                        else do
                          move <- getLine
                          if isValid board (read move)
                            then play (playMove mark board (read move)) (getOppositeMark mark)
                            else play board mark
main = play board 'O'
