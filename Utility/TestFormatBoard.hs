module Utility.TestFormatBoard where

import TestHelper
import Board.Mark
import Utility.FormatBoard
import HUnit.HUnit

testExpectedBoard    = "+++\n+++\n+++\n***\n"
testFormatBoard      = TestCase (assertEqual "format board," testExpectedBoard (formatBoard emptyBoard))
suite                = [TestLabel "Format Board" testFormatBoard]

main                 = runTestTT (TestList suite)
