module Algorithm.TestEvaluation where

import Algorithm.Evaluation
import Board.Board
import Game.Logic
import HUnit.HUnit

emptyBoard          = "+++++++++"
blockThisBoard      = "X+X++++++"
connectThisBoard    = "O+O++++++"
oWinBoard           = "OOO++++++"
oLostBoard          = "X++X++X++"
drawBoard           = "XOOOOXXXO"

testEmptyBoard      = TestCase (assertEqual "should return  2 for ongoing game,"  2    (evaluate emptyBoard 'O' wins))
testOWinBoard       = TestCase (assertEqual "should return  1 given O if O won,"  1    (evaluate oWinBoard  'O' wins))
testOLostBoard      = TestCase (assertEqual "should return -1 given O if O lost," (-1) (evaluate oLostBoard 'O' wins))
testDrawBoard       = TestCase (assertEqual "should return  0 given O if draw,"   0    (evaluate drawBoard  'O' wins))

evaluationTestSuite = [ TestLabel "Empty Board" testEmptyBoard,
                        TestLabel "O Win Board" testOWinBoard,
                        TestLabel "O Lost Board" testOLostBoard,
                        TestLabel "Draw Board" testDrawBoard]

main                = runTestTT (TestList evaluationTestSuite)
