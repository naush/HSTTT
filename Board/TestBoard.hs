module Board.TestBoard where
import Board.Board
import HUnit.HUnit
emptyBoard              = "+++++++++"
fullBoard               = "OOOOOOOOO"
newMoveBoard            = "O++++++++"
testEmptyBoard          = TestCase (assertEqual "should return false for empty board," False (isFull emptyBoard))
testFullBoard           = TestCase (assertEqual "should return true for full board," True (isFull fullBoard))
testPlayMove            = TestCase (assertEqual "should return board with new move," newMoveBoard (playMove 'O'emptyBoard 0))
testGetOppositeMarkForO = TestCase (assertEqual "should return O given X," 'X' (getOppositeMark 'O'))
testGetOppositeMarkForX = TestCase (assertEqual "should return X given O," 'O' (getOppositeMark 'X'))
boardTestSuite          = TestList [ TestLabel "Empty Board" testEmptyBoard,
                                     TestLabel "Full Board" testFullBoard,
                                     TestLabel "Play Move Board" testPlayMove,
                                     TestLabel "Opposite Mark For O" testGetOppositeMarkForO,
                                     TestLabel "Opposite Mark For X" testGetOppositeMarkForX ]
main                    = runTestTT boardTestSuite
