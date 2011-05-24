module SafeQueue (SafeQueue(..), SimpleSafeQueue(..)) where
import Prelude hiding (head, tail)

class SafeQueue q where
  empty   :: q a
  isEmpty :: (q a) -> Bool
  snoc    :: a -> (q a) -> (q a)
  head    :: (q a) -> Maybe a
  tail    :: (q a) -> Maybe (q a)

data SimpleSafeQueue a = SSQ [a]
                   deriving (Eq)

instance SafeQueue SimpleSafeQueue where
  empty = SSQ []
  isEmpty (SSQ ss) = null ss
  snoc x (SSQ ss) = SSQ (ss ++ [x]) -- これは超絶非効率!
  head (SSQ []) = Nothing
  head (SSQ (x:xs)) = Just x
  tail (SSQ []) = Nothing
  tail (SSQ (x:xs)) = Just (SSQ xs)
