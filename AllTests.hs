module AllTests where

import HUnit.HUnit
import qualified Algorithm.TestEvaluation as TestEvaluation  (suite)
import qualified Algorithm.TestMinMax     as TestMinMax      (suite)
import qualified Board.TestBoard          as TestBoard       (suite)
import qualified Board.TestMark           as TestMark        (suite)
import qualified Game.TestLogic           as TestLogic       (suite)
import qualified Utility.TestFormatBoard  as TestFormatBoard (suite)
import qualified Utility.TestIsNumeric    as TestIsNumeric   (suite)

allTests        = TestList
                  (  TestEvaluation.suite
                  ++ TestMinMax.suite
                  ++ TestBoard.suite
                  ++ TestMark.suite
                  ++ TestLogic.suite 
                  ++ TestFormatBoard.suite 
                  ++ TestIsNumeric.suite
                  )

main             = runTestTT allTests
