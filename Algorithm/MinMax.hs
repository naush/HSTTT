module Algorithm.MinMax (getBestMove) where
import Board.Board
import Game.Logic
import Control.Concurrent
getMiniMaxScore :: (Integral t, Num a, Ord a) => Char -> [[t]] -> [Char] -> a
getMiniMaxScore mark wins board = let score = evaluateBoard board mark wins in
                                    if score < 2
                                      then score
                                      else minimum
                                      (map negate
                                      (map (getMiniMaxScore (getOppositeMark mark) wins)
                                      (map (playMove (getOppositeMark mark) board)
                                      [empty | empty <- [0..length board-1], (board !! empty) == '+'])))
evaluateBoard :: (Integral t, Num t1) => [Char] -> Char -> [[t]] -> t1
evaluateBoard board mark wins
        | hasWon mark board wins                   =  1
        | hasWon (getOppositeMark mark) board wins = -1
        | isFull board                             =  0
        | otherwise                                =  2
--getScoreBoard :: (Integral t, Num a, Ord a) => Char -> [[t]] -> [Char] -> [a]
getScoreBoard mark wins board = [ if (board !! x) == '+'
                                    then getMiniMaxScore mark wins (playMove mark board x)
                                    else -2 | x <- [0..length board-1] ]
getBestMove :: [Char] -> t -> Int
getBestMove board mark = let scoreBoard = (getScoreBoard 'O' wins board) in
                         let bestScore = maximum scoreBoard in
                           head [move | move <- [0..length scoreBoard-1], (scoreBoard !! move) == bestScore ]
