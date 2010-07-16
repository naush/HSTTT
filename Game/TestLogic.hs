module Game.TestLogic where

import Game.Logic
import HUnit.HUnit

emptyBoard              = "+++++++++"
horizontalWinBoard      = "OOO++++++"
verticalWinBoard        = "X++X++X++"
diagonalWinBoard        = "O+++O+++O"
win                     = [0, 1, 2]

testEmptyBoard          = TestCase (assertEqual "should return false for empty board," False (isOver emptyBoard))
testHorizontalWinBoard  = TestCase (assertEqual "should return true for horizontal win board," True (isOver horizontalWinBoard))
testVerticalWinBoard    = TestCase (assertEqual "should return true for vertical win board," True (isOver verticalWinBoard))
testDiagonalWinBoard    = TestCase (assertEqual "should return true for diagonal win board," True (isOver diagonalWinBoard))
testOHasWinBoard        = TestCase (assertEqual "should return true for O win board," True (hasWon 'O' horizontalWinBoard))
testXHasWinBoard        = TestCase (assertEqual "should return true for X win board," True (hasWon 'X' verticalWinBoard))
testOHasWinAnyBoard     = TestCase (assertEqual "should return true for O win board," True (hasWonAny 'O' horizontalWinBoard wins))
testXHasWinAnyBoard     = TestCase (assertEqual "should return true for X win board," False (hasWonAny 'X' horizontalWinBoard wins))
testOaWinner            = TestCase (assertEqual "should return true for O win board," True (aWinner win 'O' horizontalWinBoard))
testXaWinner            = TestCase (assertEqual "should return true for X win board," False (aWinner win 'X' horizontalWinBoard))
testIsValidOutOfRange   = TestCase (assertEqual "should return false for out of range move," False (isValid emptyBoard 9))
testIsValidOccupiedMove = TestCase (assertEqual "should return false for occupied move," False (isValid horizontalWinBoard 0))

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
