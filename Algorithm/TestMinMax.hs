module Algorithm.TestMinMax where
import Algorithm.MinMax
import Board.Board
import Game.Logic
import HUnit.HUnit
emptyBoard       = "+++++++++"
oWinBoard        = "OOO++++++"
oLostBoard       = "X++X++X++"
drawBoard        = "XOOOOXXXO"
testEmptyBoard   = TestCase (assertEqual "should return  2 for ongoing game,"  2   (evaluateBoard emptyBoard 'O' wins))
testOWinBoard    = TestCase (assertEqual "should return  1 given O if O won,"  1   (evaluateBoard oWinBoard  'O' wins))
testOLostBoard   = TestCase (assertEqual "should return -1 given O if O lost," (-1) (evaluateBoard oLostBoard 'O' wins))
testDrawBoard    = TestCase (assertEqual "should return  0 given O if draw,"   0   (evaluateBoard drawBoard  'O' wins))
minMaxTestSuite  = [ TestLabel "Empty Board" testEmptyBoard,
                     TestLabel "O Win Board" testOWinBoard,
                     TestLabel "O Lost Board" testOLostBoard,
                     TestLabel "Draw Board" testDrawBoard ]
main             = runTestTT (TestList minMaxTestSuite)
