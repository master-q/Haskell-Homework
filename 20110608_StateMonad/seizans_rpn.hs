solveRPN :: String -> Double
solveRPN = head . foldl foldingFunction [] . words
	where foldingFunction (x:y:ys) "*" = (y * x):ys
	      foldingFunction (x:y:ys) "+" = (y + x):ys
	      foldingFunction (x:y:ys) "-" = (y - x):ys
	      foldingFunction xs numberString = read numberString:xs
              -- マッチしなかったら？？？落ちる

test1 = solveRPN "10 4 3 + 2 * -"
test2 = solveRPN "2 3.5 +"
test3 = solveRPN "90 34 12 33 55 66 + * - +"
test4 = solveRPN "90 34 12 33 55 66 + * - + -"
test5 = solveRPN "90 3.8 -"
test6 = solveRPN "3 4 5 + + + +"

