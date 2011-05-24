module Queue (Queue(..), SimpleQueue(..)) where
import Prelude hiding (head, tail)

class Queue q where
  empty   :: q a
  isEmpty :: (q a) -> Bool
  snoc    :: a -> (q a) -> (q a)
  head    :: (q a) -> a
  tail    :: (q a) -> (q a)

data SimpleQueue a = SQ [a]
                   deriving (Eq)

instance Queue SimpleQueue where
  empty = SQ []
  isEmpty (SQ ss) = null ss
  snoc x (SQ ss) = SQ (ss ++ [x]) -- これは超絶非効率!
  head (SQ []) = error "empty SimpleQueue"
  head (SQ (x:xs)) = x
  tail (SQ []) = error "empty SimpleQueue"
  tail (SQ (x:xs)) = SQ xs
