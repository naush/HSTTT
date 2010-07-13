module Game.TestLogic where

import Game.Logic
import HUnit.HUnit

emptyBoard              = "+++++++++"
horizontalWinBoard      = "OOO++++++"
verticalWinBoard        = "X++X++X++"
diagonalWinBoard        = "O+++O+++O"

testEmptyBoard          = TestCase (assertEqual "should return false for empty board," False (isOver emptyBoard wins))
testHorizontalWinBoard  = TestCase (assertEqual "should return true for horizontal win board," True (isOver horizontalWinBoard wins))
testVerticalWinBoard    = TestCase (assertEqual "should return true for vertical win board," True (isOver verticalWinBoard wins))
testDiagonalWinBoard    = TestCase (assertEqual "should return true for diagonal win board," True (isOver diagonalWinBoard wins))
testOWinBoard           = TestCase (assertEqual "should return true for O win board," True (hasWon 'O' horizontalWinBoard wins))
testXWinBoard           = TestCase (assertEqual "should return true for X win board," True (hasWon 'X' verticalWinBoard wins))
testIsValidOutOfRange   = TestCase (assertEqual "should return false for out of range move," False (isValid emptyBoard 9))
testIsValidOccupiedMove = TestCase (assertEqual "should return false for occupied move," False (isValid horizontalWinBoard 0))

logicTestSuite          = [ TestLabel "Empty Board" testEmptyBoard,
                            TestLabel "Horizontal Win Board" testHorizontalWinBoard,
                            TestLabel "Vertical Win Board" testVerticalWinBoard,
                            TestLabel "Diagonal Win Board" testDiagonalWinBoard,
                            TestLabel "O Win Board" testOWinBoard,
                            TestLabel "X Win Board" testXWinBoard,
                            TestLabel "Invalid Out Of Range Move" testIsValidOutOfRange,
                            TestLabel "Invalid Occupied Move" testIsValidOccupiedMove ]

main                    = runTestTT (TestList logicTestSuite)
