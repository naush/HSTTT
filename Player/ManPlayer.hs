module Player.ManPlayer (play) where

import Board.Board (playMove)
import Game.Logic as Game (isValid)
import Utility.IsNumeric (isNumeric)
import qualified Board.Mark as Mark
import qualified UI.Menu as Menu (askMove)
import qualified Utility.IO as IO (gets)

play board mark =
     do input <- Menu.askMove IO.gets
        if isNumeric input && (isValid board $ read input - 1)
           then return (playMove mark board $ read input - 1, Mark.opposite mark)
           else return (board, mark)
