module Algorithm.TestEvaluation where

import Algorithm.Evaluation
import Board.Board
import Game.Logic
import HUnit.HUnit
import qualified Algorithm.Score as Score

emptyBoard          = "+++++++++"
blockThisBoard      = "X+X++++++"
connectThisBoard    = "O+O++++++"
oWinBoard           = "OOO++++++"
oLostBoard          = "X++X++X++"
drawBoard           = "XOOOOXXXO"

testEmptyBoard      = TestCase (assertEqual "should return continue score for ongoing game," Score.max     (evaluate emptyBoard 'O'))
testOWinBoard       = TestCase (assertEqual "should return win score given O if O won,"      Score.win     (evaluate oWinBoard  'O'))
testOLostBoard      = TestCase (assertEqual "should return lose score given O if O lost,"    Score.lose    (evaluate oLostBoard 'O'))
testDrawBoard       = TestCase (assertEqual "should return draw score given O if draw,"      Score.draw    (evaluate drawBoard  'O'))

evaluationTestSuite = [ TestLabel "Empty Board" testEmptyBoard,
                        TestLabel "O Win Board" testOWinBoard,
                        TestLabel "O Lost Board" testOLostBoard,
                        TestLabel "Draw Board" testDrawBoard]

main                = runTestTT (TestList evaluationTestSuite)
