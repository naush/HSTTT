module Algorithm.TestMinMax where

import TestHelper
import Algorithm.Evaluation
import Algorithm.MinMax
import Board.Mark
import Game.Logic
import HUnit.HUnit
import qualified Algorithm.Score as Score
import qualified Board.Board as Board

testInvincible board
        | score == Score.lose   = False
        | score == Score.draw   = True
        | score == Score.win    = True
        | otherwise     = let newBoard = Board.playMove o board (getBestMove board o) in
                              foldr (&&) True $ map testInvincible $ playAllPossibleMoves x newBoard
        where score = evaluate board o

emptyBoard               = [empty, empty, empty, empty, empty, empty, empty, empty, empty]
blockThisBoard           = [x, empty, x, empty, empty, empty, empty, empty, empty]
connectThisBoard         = [o, empty, o, empty, empty, empty, empty, empty, empty]

testFirstMove            = TestCase (assertEqual "should play the first available move," 0 (getBestMove emptyBoard o))
testBlockMove            = TestCase (assertEqual "should play the blocking move," 1 (getBestMove blockThisBoard o))
testConnectMove          = TestCase (assertEqual "should play the connecting move," 1 (getBestMove connectThisBoard o))
testInvincibleStartFirst = TestCase (assertTrue  "should return True if is invincible starting first," $ testInvincible emptyBoard)
testInvincibleStartLast  = TestCase (assertTrue  "should return True if is invincible starting last,"
                                    (foldr (&&) True $ map testInvincible $ playAllPossibleMoves x emptyBoard))

suite  = [ TestLabel "First Move" testFirstMove,
           TestLabel "Block Move" testBlockMove,
           TestLabel "Connect Move" testConnectMove,
           TestLabel "Invincible Start First" testInvincibleStartFirst,
           TestLabel "Invincible Start Last" testInvincibleStartLast ]

main   = runTestTT (TestList suite)
