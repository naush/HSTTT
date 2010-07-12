module AllTests where
import Algorithm.TestMinMax
import Board.TestBoard
import Board.TestMark
import Game.TestLogic
import Utility.TestFormatBoard
import Utility.TestIsNumeric
import HUnit.HUnit
allTests        = TestList
                  (  minMaxTestSuite
                  ++ boardTestSuite
                  ++ logicTestSuite 
                  ++ formatBoardTestSuite 
                  ++ isNumericTestSuite
                  ++ markTestSuite
                  )
runtests        = runTestTT allTests
