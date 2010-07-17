module Board.Mark
( Mark
, o
, x
, empty
, opposite
, toChar
) where

data Mark = O
          | X
          | E
          deriving (Eq)

o       = O
x       = X
empty   = E

opposite :: Mark -> Mark
opposite O = X
opposite X = O

toChar :: Mark -> Char
toChar mark
     | mark == O = 'o'
     | mark == X = 'x'
     | mark == E = '+'

instance Show Mark where
         show O = show 'o'
         show X = show 'x'
         show E = show '+'
