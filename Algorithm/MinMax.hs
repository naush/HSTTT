module Algorithm.MinMax
( getBestMove
, playAllPossibleMoves
) where

import Algorithm.Evaluation
import Control.Parallel
import Control.Parallel.Strategies
import qualified Algorithm.Score as Score
import qualified Board.Board as Board
import qualified Board.Mark as Mark

getScores mark []      = []
getScores mark boards  =
          let board:bs = boards in
          let score    = negate (getMiniMaxScore mark board) in
              if score == Score.lose
                 then [score]
                 else score:(getScores mark bs)

playAllPossibleMoves mark board = map (Board.playMove mark board) (Board.findEmpty board)

getMiniMaxScore mark board =
                let score = evaluate board mark in
                    if score < Score.max
                       then score
                       else let oppositeMark = Mark.getOpposite mark in
                            let allPossibleBoards = playAllPossibleMoves oppositeMark board in
                                minimum (getScores oppositeMark allPossibleBoards)

fillScoreBoard mark board position =
               if Board.isEmpty board position
                  then getMiniMaxScore mark (Board.playMove mark board position)
                  else Score.min

getScoreBoard mark board = parMap rwhnf (fillScoreBoard mark board) Board.range
-- getScoreBoard mark board = map (fillScoreBoard mark board) Board.range

getBestMove board mark = let scoreBoard = getScoreBoard Mark.o board in
                         let bestScore = maximum scoreBoard in
                         let bestMove (move:ms) = if scoreBoard !! move == bestScore
                                                     then move
                                                     else bestMove ms
                         in bestMove Board.range
