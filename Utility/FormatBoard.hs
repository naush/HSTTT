module Utility.FormatBoard (formatBoard) where

import Board.Mark as Mark

formatBoard :: [Mark] -> [Char]
formatBoard board = [ toChar (board !! 0), toChar (board !! 1), toChar (board !! 2), '\n',
                      toChar (board !! 3), toChar (board !! 4), toChar (board !! 5), '\n',
                      toChar (board !! 6), toChar (board !! 7), toChar (board !! 8), '\n',
                      '*', '*', '*', '\n' ]
