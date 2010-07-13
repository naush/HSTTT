module Utility.TestFormatBoard where

import Utility.FormatBoard
import HUnit.HUnit

testBoard = "+++++++++"
testExpectedBoard = "+++\n+++\n+++\n***\n"
testFormatBoard = TestCase (assertEqual "format board," testExpectedBoard (formatBoard testBoard))
formatBoardTestSuite = [TestLabel "Format Board" testFormatBoard]

main = runTestTT (TestList formatBoardTestSuite)
