module Game.Logic (
        wins,
        isOver,
        hasWon,
        isValid) where
import Board.Board
wins = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
isOver :: (Integral t) => [Char] -> [[t]] -> Bool
isOver board wins = isFull board || hasWon 'O' board wins || hasWon 'X' board wins
hasWon :: (Integral t, Eq a) => a -> [a] -> [[t]] -> Bool
hasWon mark board wins = length [win | win <- wins, length [position | position <- win, (board !! fromIntegral position) == mark] == 3] > 0
isValid :: [Char] -> Int -> Bool
isValid board move = elem move [0..(length board - 1)] && (board !! move) == '+'
