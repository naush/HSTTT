module Algorithm.TestMinMax where
import Algorithm.Evaluation
import Algorithm.MinMax
import Board.Board
import Board.Mark as Mark
import Game.Logic
import HUnit.HUnit

testInvincible board
        | score == -1   = False
        | score ==  0   = True
        | score ==  1   = True
        | otherwise     = let newBoard = playMove Mark.o board (getBestMove board Mark.o) in
                              foldr (&&) True (map testInvincible (map (playMove Mark.x newBoard) [empty | empty <- [0..length newBoard-1], newBoard !! empty == Mark.empty]))
        where score = evaluate board Mark.o wins

emptyBoard       = "+++++++++"
blockThisBoard   = "X+X++++++"
connectThisBoard = "O+O++++++"

testFirstMove    = TestCase (assertEqual "should play the first available move," 0 (getBestMove emptyBoard Mark.o))
testBlockMove    = TestCase (assertEqual "should play the blocking move," 1 (getBestMove blockThisBoard Mark.o))
testConnectMove  = TestCase (assertEqual "should play the connecting move," 1 (getBestMove connectThisBoard Mark.o))
testInvincibleStartFirst = TestCase (assertEqual "should return True if is invincible starting first," True (testInvincible emptyBoard))
testInvincibleStartLast = TestCase (assertEqual "should return True if is invincible starting last," True (foldr (&&) True (map testInvincible (map (playMove Mark.x emptyBoard) [empty | empty <- [0..length emptyBoard-1], emptyBoard !! empty == Mark.empty]))))

minMaxTestSuite  = [ TestLabel "First Move" testFirstMove,
                     TestLabel "Block Move" testBlockMove,
                     TestLabel "Connect Move" testConnectMove,
                     TestLabel "Invincible Start First" testInvincibleStartFirst,
                     TestLabel "Invincible Start Last" testInvincibleStartLast ]

main             = runTestTT (TestList minMaxTestSuite)
