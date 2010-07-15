module Utility.TestIsNumeric where

import Utility.IsNumeric
import HUnit.HUnit

testNumber          = TestCase (assertEqual "should return true for number,"  True (isNumeric "100"))
testDigit           = TestCase (assertEqual "should return true for digit,"   True (isNumeric "1"))
testLetter          = TestCase (assertEqual "should return false for letter," False (isNumeric "a"))
testString          = TestCase (assertEqual "should return false for string," False (isNumeric "abc"))
testSymbol          = TestCase (assertEqual "should return false for symbol," False (isNumeric "#"))

isNumericTestSuite  = [ TestLabel "Number" testNumber,
                        TestLabel "Digit" testDigit,
                        TestLabel "Letter" testLetter,
                        TestLabel "String" testString,
                        TestLabel "Symbol" testString ]

main                = runTestTT (TestList isNumericTestSuite)
