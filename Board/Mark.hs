module Board.Mark
( oMark
, xMark
, emptyMark
, getOppositeMark
) where
oMark = 'O'
xMark = 'X'
emptyMark = '+'
getOppositeMark mark = if mark == oMark then xMark else oMark
