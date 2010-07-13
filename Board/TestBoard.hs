module Board.TestBoard where
import Board.Board
import HUnit.HUnit

emptyBoard              = "+++++++++"
fullBoard               = "OOOOOOOOO"
newMoveBoard            = "O++++++++"

testEmptyBoard          = TestCase (assertEqual "should return false for empty board," False (isFull emptyBoard))
testFullBoard           = TestCase (assertEqual "should return true for full board," True (isFull fullBoard))
testPlayMove            = TestCase (assertEqual "should return board with new move," newMoveBoard (playMove 'O' emptyBoard 0))

boardTestSuite          = [ TestLabel "Empty Board" testEmptyBoard,
                            TestLabel "Full Board" testFullBoard,
                            TestLabel "Play Move Board" testPlayMove]

main                    = runTestTT (TestList boardTestSuite)
