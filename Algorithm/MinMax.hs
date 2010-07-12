module Algorithm.MinMax
( getBestMove
, evaluateBoard
) where
import Board.Board
import Board.Mark
import Game.Logic
getListScores getMiniMaxScore mark wins listBoards
              | len == 0      = []
              | len == 1      = [getMiniMaxScore mark wins (head listBoards)]
              | otherwise     = let board:rest = listBoards in
                                let score      = getMiniMaxScore mark wins board in
                                    if score == 1
                                       then [score]
                                       else score:(getListScores getMiniMaxScore mark wins rest)
              where len = length listBoards
getMiniMaxScore mark wins board =
                let score = evaluateBoard board mark wins in
                    if score < 2
                       then score
                       else let emptySpots = [empty | empty <- [0..length board-1], (board !! empty) == emptyMark] in
                            let oppositeMark = getOppositeMark mark in
                            let listBoards = map (playMove oppositeMark board) emptySpots in
                            let listScores = getListScores getMiniMaxScore oppositeMark wins listBoards in
                                minimum (map negate listScores)
evaluateBoard board mark wins
              | hasWon mark board wins                   =  1
              | hasWon (getOppositeMark mark) board wins = -1
              | isFull board                             =  0
              | otherwise                                =  2
getScoreBoard mark wins board = [ if (board !! x) == emptyMark
                                     then getMiniMaxScore mark wins (playMove mark board x)
                                     else -2 | x <- [0..length board-1] ]
getBestMove board mark = let scoreBoard = (getScoreBoard 'O' wins board) in
                         let bestScore = maximum scoreBoard in
                             head [move | move <- [0..length scoreBoard-1], (scoreBoard !! move) == bestScore]
