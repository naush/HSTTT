module AllTests where

import Algorithm.TestMinMax
import Algorithm.TestEvaluation
import Board.TestBoard
import Board.TestMark
import Game.TestLogic
import Utility.TestFormatBoard
import Utility.TestIsNumeric
import HUnit.HUnit

allTests        = TestList
                  (  minMaxTestSuite
                  ++ evaluationTestSuite
                  ++ boardTestSuite
                  ++ logicTestSuite 
                  ++ formatBoardTestSuite 
                  ++ isNumericTestSuite
                  ++ markTestSuite
                  )

run             = runTestTT allTests
