module UI.TestMenu where

import HUnit.HUnit
import UI.Menu as Menu
import qualified Board.Mark as Mark

mockBoard                        = "+++++++++"
mockFormatBoard board            = board

testPrint expected actual        = expected == actual
printGameOver message            = testPrint "Game Over\n" message
printEnterMove message           = testPrint "Enter your move (1-9) :\n" message
printOrderQuestion message       = testPrint "Play first? Last?\n" message
printBoard message               = testPrint mockBoard message
gets given                       = return given

testPutGameOver       = TestCase (assertEqual "should return true if the outputs matched," True (putGameOver printGameOver))
testPutEnterMove      = TestCase (assertEqual "should return true if the outputs matched," True (putEnterMove printEnterMove))
testPutOrderQuestion  = TestCase (assertEqual "should return true if the outputs matched," True (putOrderQuestion printOrderQuestion))
testPutBoard          = TestCase (assertEqual "should call formatBoard and puts board,"    True (putBoard printBoard mockFormatBoard mockBoard))
testGetMarkFirstUpper = TestCase (assertEqual "should return X for FIRST," Mark.x (getMark "FIRST"))
testGetMarkFirstShort = TestCase (assertEqual "should return X for f," Mark.x (getMark "f"))
testGetMarkLastUpper  = TestCase (assertEqual "should return O for LAST,"  Mark.o (getMark "LAST"))
testGetMarkLastShort  = TestCase (assertEqual "should return O for l,"  Mark.o (getMark "l"))

testAskMove           = TestCase (do move <- askMove (gets 0)
                                     assertEqual "should return 0," 0 move)

testAskOrder          = TestCase (do mark <- askOrder (gets "last")
                                     assertEqual "should return O for last," Mark.o mark)

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
