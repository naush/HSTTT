module Board.TestBoard where
import Board.Board
import HUnit.HUnit
import qualified Board.Mark as Mark

emptyBoard              = "+++++++++"
fullBoard               = "OOOOOOOOO"
newMoveBoard            = "O++++++++"

testEmptyBoard          = TestCase (assertEqual "should return false for empty board," False (isFull emptyBoard))
testIsFull              = TestCase (assertEqual "should return true for full board," True (isFull fullBoard))
testIsEmpty             = TestCase (assertEqual "should return true if given position is empty," True (isEmpty emptyBoard 0))
testPlayMove            = TestCase (assertEqual "should return board with new move," newMoveBoard (playMove Mark.o emptyBoard 0))
testFindEmpty           = TestCase (assertEqual "should return all empty spots," [1, 2, 3, 4, 5, 6, 7, 8] (findEmpty newMoveBoard))
testFindMark            = TestCase (assertEqual "should return index if given mark matches," [1, 2, 3, 4, 5, 6, 7, 8] (findMark newMoveBoard Mark.empty))

suite          = [ TestLabel "Empty Board" testEmptyBoard,
                   TestLabel "Board Is Full" testIsFull,
                   TestLabel "Given Position Is Empty" testIsEmpty,
                   TestLabel "Play Move Board" testPlayMove,
                   TestLabel "Find Empty Spots" testFindEmpty,
                   TestLabel "Find Matched Mark" testFindMark ]

main           = runTestTT (TestList suite)
