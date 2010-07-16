module Utility.TestFormatBoard where

import Board.Mark
import Utility.FormatBoard
import HUnit.HUnit

testBoard            = [empty, empty, empty, empty, empty, empty, empty, empty, empty]
testExpectedBoard    = "+++\n+++\n+++\n***\n"
testFormatBoard      = TestCase (assertEqual "format board," testExpectedBoard (formatBoard testBoard))
suite                = [TestLabel "Format Board" testFormatBoard]

main                 = runTestTT (TestList suite)
