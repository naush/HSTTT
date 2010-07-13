module Board.Mark
( o
, x
, empty
, getOpposite
) where

o = 'O'
x = 'X'
empty = '+'
getOpposite mark = if mark == o then x else o
