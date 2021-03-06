module SafeStack (SafeStack(..), SimpleSafeStack) where
import Prelude hiding (head, tail)

class SafeStack s where
  empty   :: s a
  isEmpty :: s a -> Bool
  cons    :: a -> s a -> s a
  head    :: s a -> Maybe a
  tail    :: s a -> Maybe (s a) -- Maybeとsがくっつかないようにカッコつける!

data SimpleSafeStack a = SSS [a]
                     deriving (Eq)

instance SafeStack SimpleSafeStack where
  empty = SSS []
  isEmpty (SSS ss) = null ss
  cons x (SSS ss) = SSS (x : ss)
  head (SSS (x:xs)) = Just x
  head (SSS []) = Nothing
  tail (SSS (x:xs)) = Just (SSS xs)
  tail (SSS []) = Nothing
