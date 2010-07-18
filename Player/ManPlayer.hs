module Player.ManPlayer (play) where

import Board.Board (playMove)
import Game.Logic as Game (isValid)
import Utility.IsNumeric (isNumeric)
import qualified Board.Mark as Mark
import qualified UI.Menu as Menu (askMove)

play board mark =
     do input <- Menu.askMove
        if isNumeric input && (isValid board $ read input - 1)
           then return (True, playMove mark board $ read input - 1)
           else return (False, board)
