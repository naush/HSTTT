module Board.TestBoard where

import TestHelper
import Board.Board
import Board.Mark
import HUnit.HUnit

emptyBoard              = [empty, empty, empty, empty, empty, empty, empty, empty, empty]
fullBoard               = [o, o, o, o, o, o, o, o, o]
newMoveBoard            = [o, empty, empty, empty, empty, empty, empty, empty, empty]

testEmptyBoard          = TestCase (assertFalse "should return false for empty board," $ isFull emptyBoard)
testIsFull              = TestCase (assertTrue  "should return true for full board," $ isFull fullBoard)
testIsEmpty             = TestCase (assertTrue  "should return true if given position is empty," $ isEmpty emptyBoard 0)
testPlayMove            = TestCase (assertEqual "should return board with new move," newMoveBoard $ playMove o emptyBoard 0)
testFindEmpty           = TestCase (assertEqual "should return all empty spots," [1, 2, 3, 4, 5, 6, 7, 8] $ findEmpty newMoveBoard)

suite          = [ TestLabel "Empty Board" testEmptyBoard,
                   TestLabel "Board Is Full" testIsFull,
                   TestLabel "Given Position Is Empty" testIsEmpty,
                   TestLabel "Play Move Board" testPlayMove,
                   TestLabel "Find Empty Spots" testFindEmpty ]

main           = runTestTT (TestList suite)
