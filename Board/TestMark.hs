module Board.TestMark where
import Board.Mark
import HUnit.HUnit
testGetOppositeMarkForO = TestCase (assertEqual "should return O given X," xMark (getOppositeMark oMark))
testGetOppositeMarkForX = TestCase (assertEqual "should return X given O," oMark (getOppositeMark xMark))
markTestSuite          = [ TestLabel "Get Opposite Mark For O" testGetOppositeMarkForO,
                           TestLabel "Get Opposite Mark For X" testGetOppositeMarkForX ]
main                    = runTestTT (TestList markTestSuite)
