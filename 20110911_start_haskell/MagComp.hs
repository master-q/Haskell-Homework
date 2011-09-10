module MagComp (magComp) where

magComp :: Float -> Float -> Float
magComp a b = 10 ** (1.5 * (a - b))
