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
                  (  evaluationTestSuite
                  ++ minMaxTestSuite
                  ++ boardTestSuite
                  ++ markTestSuite
                  ++ logicTestSuite 
                  ++ formatBoardTestSuite 
                  ++ isNumericTestSuite
                  )

run             = runTestTT allTests
