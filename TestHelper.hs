module TestHelper where

import Board.Mark
import HUnit.HUnit

emptyBoard          = [empty, empty, empty, empty, empty, empty, empty, empty, empty]
fullBoard           = [o,     o,     o,     o,     o,     o,     o,     o,     o    ]
oneMoveBoard        = [o,     empty, empty, empty, empty, empty, empty, empty, empty]
blockThisBoard      = [x,     empty, x,     empty, empty, empty, empty, empty, empty]
connectThisBoard    = [o,     empty, o,     empty, empty, empty, empty, empty, empty]
oWinBoard           = [o,     o,     o,     empty, empty, empty, empty, empty, empty]
oLoseBoard          = [x,     empty, empty, x,     empty, empty, x,     empty, empty]
drawBoard           = [x,     o,     o,     o,     o,     x,     x,     x,     o    ]
horizontalWinBoard  = [o,     o,     o,     empty, empty, empty, empty, empty, empty]
verticalWinBoard    = [x,     empty, empty, x,     empty, empty, x,     empty, empty]
diagonalWinBoard    = [o,     empty, empty, empty, o,     empty, empty, empty, o    ]

assertTrue  description expression = assertEqual description True  expression
assertFalse description expression = assertEqual description False expression
