module Game.TestLogic where

import TestHelper
import Board.Mark
import Game.Logic
import HUnit.HUnit

emptyBoard              = [empty, empty, empty, empty, empty, empty, empty, empty, empty]
horizontalWinBoard      = [o, o, o, empty, empty, empty, empty, empty, empty]
verticalWinBoard        = [x, empty, empty, x, empty, empty, x, empty, empty]
diagonalWinBoard        = [o, empty, empty, empty, o, empty, empty, empty, o]
win                     = [0, 1, 2]

testEmptyBoard          = TestCase (assertFalse "should return false for empty board," $ isOver emptyBoard)
testHorizontalWinBoard  = TestCase (assertTrue  "should return true for horizontal win board," $ isOver horizontalWinBoard)
testVerticalWinBoard    = TestCase (assertTrue  "should return true for vertical win board," $ isOver verticalWinBoard)
testDiagonalWinBoard    = TestCase (assertTrue  "should return true for diagonal win board," $ isOver diagonalWinBoard)
testOHasWinBoard        = TestCase (assertTrue  "should return true for O win board," $ hasWon o horizontalWinBoard)
testXHasWinBoard        = TestCase (assertTrue  "should return true for X win board," $ hasWon x verticalWinBoard)
testOHasWinAnyBoard     = TestCase (assertTrue  "should return true for O win board," $ hasWonAny o horizontalWinBoard wins)
testXHasWinAnyBoard     = TestCase (assertFalse "should return true for X win board," $ hasWonAny x horizontalWinBoard wins)
testOaWinner            = TestCase (assertTrue  "should return true for O win board," $ aWinner win o horizontalWinBoard)
testXaWinner            = TestCase (assertFalse "should return true for X win board," $ aWinner win x horizontalWinBoard)
testIsValidOutOfRange   = TestCase (assertFalse "should return false for out of range move," $ isValid emptyBoard 9)
testIsValidOccupiedMove = TestCase (assertFalse "should return false for occupied move," $ isValid horizontalWinBoard 0)

suite = [ TestLabel "Empty Board" testEmptyBoard,
          TestLabel "Horizontal Win Board" testHorizontalWinBoard,
          TestLabel "Vertical Win Board" testVerticalWinBoard,
          TestLabel "Diagonal Win Board" testDiagonalWinBoard,
          TestLabel "O Win Board" testOHasWinBoard,
          TestLabel "X Win Board" testXHasWinBoard,
          TestLabel "O Win Any Board" testOHasWinAnyBoard,
          TestLabel "X Win Any Board" testXHasWinAnyBoard,
          TestLabel "O A Winner" testOaWinner,
          TestLabel "X A Winner" testXaWinner,
          TestLabel "Invalid Out Of Range Move" testIsValidOutOfRange,
          TestLabel "Invalid Occupied Move" testIsValidOccupiedMove ]

main  = runTestTT (TestList suite)
