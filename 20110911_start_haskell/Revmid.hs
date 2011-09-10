module Revmid (revmid) where

revmid :: [a] -> [a]
revmid list | length list <= 2 = list
            | otherwise = [h] ++ r ++ [l]
  where
    h = head list
    l = last list
    r = reverse . tail . init $ list
