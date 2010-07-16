module Player.ManPlayer (play) where

import Board.Board (playMove)
import Game.Logic as Game (isValid)
import Utility.IsNumeric (isNumeric)
import qualified Board.Mark as Mark
import qualified UI.Menu as Menu (askMove)

play run board mark =
     do input <- Menu.askMove
        if isNumeric input && (isValid board $ read input - 1)
           then run (playMove mark board $ read input - 1) $ Mark.opposite mark
           else run board mark
