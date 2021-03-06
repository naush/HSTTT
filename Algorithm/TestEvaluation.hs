module Algorithm.TestEvaluation where

import TestHelper
import Algorithm.Evaluation
import Board.Board
import Game.Logic
import HUnit.HUnit
import Board.Mark
import qualified Algorithm.Score as Score

testEmptyBoard      = TestCase (assertEqual "should return continue score for ongoing game," Score.max     (evaluate emptyBoard o))
testOWinBoard       = TestCase (assertEqual "should return win score given O if O won,"      Score.win     (evaluate oWinBoard  o))
testOLoseBoard      = TestCase (assertEqual "should return lose score given O if O lost,"    Score.lose    (evaluate oLoseBoard o))
testDrawBoard       = TestCase (assertEqual "should return draw score given O if draw,"      Score.draw    (evaluate drawBoard  o))

suite = [ TestLabel "Empty Board" testEmptyBoard,
          TestLabel "O Win Board" testOWinBoard,
          TestLabel "O Lose Board" testOLoseBoard,
          TestLabel "Draw Board" testDrawBoard]

main  = runTestTT (TestList suite)
