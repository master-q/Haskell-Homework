module Stack (Stack(..), SimpleStack) where -- Stack
import Prelude hiding (head, tail)

class Stack s where
  empty   :: s a
  isEmpty :: s a -> Bool -- "s a"は関数適用、"->"演算子のようなもの、関数適用の方が優先度が↑ 慣れろ!!!!
  cons    :: a -> s a -> s a
  head    :: s a -> a
  tail    :: s a -> s a

data SimpleStack a = SS [a]
                     deriving (Eq)

instance Stack SimpleStack where
  empty = SS []
  isEmpty (SS ss) = null ss
--  isEmpty = ( == empty) -- これは推論できない？うわーん
  cons x (SS ss) = SS (x : ss)
  head (SS (x:_)) = x
  head (SS []) = error "empty SimpleStack" -- こっちをあんまり使わないなら後ろの行
  tail (SS (_:xs)) = SS xs
  tail (SS []) = error "empty SimpleStack"
