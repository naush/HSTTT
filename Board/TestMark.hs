module Board.TestMark where

import qualified Board.Mark as Mark
import HUnit.HUnit

testGetOppositeMarkForO = TestCase (assertEqual "should return O given X," Mark.x (Mark.opposite Mark.o))
testGetOppositeMarkForX = TestCase (assertEqual "should return X given O," Mark.o (Mark.opposite Mark.x))
testToChar              = TestCase (assertEqual "should return 'o' for O" 'o' (Mark.toChar Mark.o))

suite           = [ TestLabel "Get Opposite Mark For O" testGetOppositeMarkForO,
                    TestLabel "Get Opposite Mark For X" testGetOppositeMarkForX,
                    TestLabel "To Char" testToChar ]

main            = runTestTT (TestList suite)
