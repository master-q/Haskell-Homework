newtype State s a = State { runState :: (s -> (a,s))}
-- newtypeとtypeの違い
-- type: alias
-- newtype: データ構築子の数が一つのdata

instance Monad (State s) where
	return a    = State $ \s -> (a,s)
	(State x) >>= f = State $ \s -> let (v, s') = x s in runState (f v) s'
--                                              ^^ 'はとくに意味なし
-- 'は"次の"とか"変更された"とか

--class MonadState m s | m -> where
--	get :: m s
--	put :: s -> m ()

--instance MonadState (State s)  s where
--	get = State $ \s -> (s, s)
--	put s = State $ \_ -> ((), s)

main = interact $ unlines . zipWith(\i s -> show i ++ ": " ++ s)[1..] . lines
--     interact ( unlines . zipWith(\i s -> show i ++ ": " ++ s)[1..] . lines )
-- Prelude> :i (.)
-- (.) :: (b -> c) -> (a -> b) -> a -> c 	-- Defined in GHC.Base
-- infixr 9 .
-- Prelude> :i ($)
-- ($) :: (a -> b) -> a -> b 	-- Defined in GHC.Base
-- infixr 0 $
-- .は強い! $は最弱...λ
