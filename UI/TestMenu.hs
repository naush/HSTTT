module UI.TestMenu where

import TestHelper
import HUnit.HUnit
import UI.Menu as Menu
import Board.Board (board)
import qualified Board.Mark as Mark

mockBoard                        = "+++++++++"
mockFormatBoard board            = board

testPrint expected actual        = expected == actual
printGameOver message            = testPrint "Game Over\n" message
printEnterMove message           = testPrint "Enter your move (1-9) :\n" message
printOrderQuestion message       = testPrint "Play first? Last?\n" message
printBoard message               = testPrint mockBoard message
gets given                       = return given

testPutGameOver       = TestCase (assertTrue  "should return true if the outputs matched," $ putGameOver printGameOver)
testPutEnterMove      = TestCase (assertTrue  "should return true if the outputs matched," $ putEnterMove printEnterMove)
testPutOrderQuestion  = TestCase (assertTrue  "should return true if the outputs matched," $ putOrderQuestion printOrderQuestion)
testPutBoard          = TestCase (assertTrue  "should call formatBoard and puts board,"    $ putBoard printBoard mockFormatBoard mockBoard)
testGetMarkFirstUpper = TestCase (assertEqual "should return X for FIRST,"                 Mark.x $ getMark "FIRST")
testGetMarkFirstShort = TestCase (assertEqual "should return X for f,"                     Mark.x $ getMark "f")
testGetMarkLastUpper  = TestCase (assertEqual "should return O for LAST,"                  Mark.o $ getMark "LAST")
testGetMarkLastShort  = TestCase (assertEqual "should return O for l,"                     Mark.o $ getMark "l")

testAskMove           = TestCase (do move <- askMove (gets 0)
                                     assertEqual "should return 0," 0 move)

testAskOrder          = TestCase (do (actualBoard, mark) <- askOrder (gets "last")
                                     assertEqual "should return O for last," (board, Mark.o) (actualBoard, mark))

suite = [ TestLabel "Game Over Message" testPutGameOver,
          TestLabel "Enter Move Message" testPutEnterMove,
          TestLabel "Order Question Message" testPutOrderQuestion,
          TestLabel "Board Message" testPutBoard,
          TestLabel "Get Mark - Return O For FIRST" testGetMarkFirstUpper,
          TestLabel "Get Mark - Return O For f" testGetMarkFirstShort,
          TestLabel "Get Mark - Return X For LAST" testGetMarkLastUpper,
          TestLabel "Get Mark - Return X For l" testGetMarkLastShort,
          TestLabel "Ask Move" testAskMove,
          TestLabel "Ask Order" testAskOrder ]

main  = runTestTT (TestList suite)
