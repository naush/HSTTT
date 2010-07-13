module Algorithm.MinMax
( getBestMove
) where

import Algorithm.Evaluation
import Board.Board
import Game.Logic
import qualified Algorithm.Score as Score
import qualified Board.Mark as Mark

getListScores getMiniMaxScore mark wins listBoards
              | len == 0      = []
              | len == 1      = [getMiniMaxScore mark wins (head listBoards)]
              | otherwise     = let board:rest = listBoards in
                                let score      = getMiniMaxScore mark wins board in
                                    if score == Score.win
                                       then [score]
                                       else score:(getListScores getMiniMaxScore mark wins rest)
              where len = length listBoards

getMiniMaxScore mark wins board =
                let score = evaluate board mark wins in
                    if score < Score.maximum
                       then score
                       else let emptySpots = [empty | empty <- [0..length board-1], (board !! empty) == Mark.empty] in
                            let oppositeMark = Mark.getOpposite mark in
                            let listBoards = map (playMove oppositeMark board) emptySpots in
                            let listScores = getListScores getMiniMaxScore oppositeMark wins listBoards in
                                minimum (map negate listScores)

getScoreBoard mark wins board = [ if (board !! x) == Mark.empty
                                     then getMiniMaxScore mark wins (playMove mark board x)
                                     else Score.minimum | x <- [0..length board-1] ]

getBestMove board mark = let scoreBoard = (getScoreBoard 'O' wins board) in
                         let bestScore = maximum scoreBoard in
                             head [move | move <- [0..length scoreBoard-1], (scoreBoard !! move) == bestScore]
