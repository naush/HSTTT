module Board.TestMark where

import qualified Board.Mark as Mark
import HUnit.HUnit

testGetOppositeMarkForO = TestCase (assertEqual "should return O given X," Mark.x (Mark.getOpposite Mark.o))
testGetOppositeMarkForX = TestCase (assertEqual "should return X given O," Mark.o (Mark.getOpposite Mark.x))

markTestSuite          = [ TestLabel "Get Opposite Mark For O" testGetOppositeMarkForO,
                           TestLabel "Get Opposite Mark For X" testGetOppositeMarkForX ]

main                    = runTestTT (TestList markTestSuite)
