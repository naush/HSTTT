module TestHelper where

import HUnit.HUnit

assertTrue description expression  = assertEqual description True expression
assertFalse description expression = assertEqual description False expression
