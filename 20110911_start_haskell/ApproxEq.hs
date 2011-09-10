module ApproxEq (approxEq, approxEq', approxZero) where

approxEq :: Float -> Float -> Float -> Bool
approxEq d a b = (a - d) < b && b < (a + d)

approxEq' :: Float -> Float -> Bool
approxEq' = approxEq 0.0001

approxZero :: Float -> Bool
approxZero = approxEq' 0
