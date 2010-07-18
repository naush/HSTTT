module Utility.TestIsNumeric where

import TestHelper
import Utility.IsNumeric
import HUnit.HUnit

testNumber          = TestCase (assertTrue  "should return true for number,"  $ isNumeric "100")
testDigit           = TestCase (assertTrue  "should return true for digit,"   $ isNumeric "1")
testLetter          = TestCase (assertFalse "should return false for letter," $ isNumeric "a")
testString          = TestCase (assertFalse "should return false for string," $ isNumeric "abc")
testSymbol          = TestCase (assertFalse "should return false for symbol," $ isNumeric "#")

suite  = [ TestLabel "Number" testNumber,
           TestLabel "Digit" testDigit,
           TestLabel "Letter" testLetter,
           TestLabel "String" testString,
           TestLabel "Symbol" testString ]

main   = runTestTT (TestList suite)
