module Main (main) where
import Test.HUnit
import MagComp
import ApproxEq
import CompLevel

-- MagComp
testMagComp1000 :: Test
testMagComp1000 =
  TestCase $ assertEqual "magComp 9 7 = 1000.0" 1000.0 r
  where r = magComp 9 7

testMagComp15 :: Test
testMagComp15 =
  TestCase $ assertEqual "magComp 7.0 6.2 = 15.848943" 15.848943 r
  where r = magComp 7.0 6.2

testMagComp05 :: Test
testMagComp05 =
  TestCase $ assertEqual "magComp 6.8 7.0 = 1000.0" 0.50118756 r
  where r = magComp 6.8 7.0

-- ApproxEq
testApproxEq :: Test
testApproxEq =
  TestCase $ do assertEqual "approxEq 0.01 0 0.01 = False" False r1
                assertEqual "approxEq 0.01 0 0.0099 = True" True r2
                assertEqual "approxEq 0.001 (22 / 7) pi = False" False r3
                assertEqual "approxEq 0.01 (22 / 7) pi = True" True r4
                  where r1 = approxEq 0.01 0 0.01
                        r2 = approxEq 0.01 0 0.0099
                        r3 = approxEq 0.001 (22 / 7) pi
                        r4 = approxEq 0.01 (22 / 7) pi

testApproxEq' :: Test
testApproxEq' =
  TestCase $ assertEqual "(99 / 70) `approxEq'` (sqrt 2) = True" True r
  where r = (99 / 70) `approxEq'` sqrt 2

testApproxZero :: Test
testApproxZero =  
  TestCase $ do assertEqual "approxZero (-1 / 999) = False" False r1
                assertEqual "approxZero (0.5 ^ 14) = True" True r2
                  where r1 = approxZero (-1 / 999)
                        r2 = approxZero (0.5 ** 14)

-- compLevel
testCompLevel :: Test
testCompLevel =
  TestCase $ do assertEqual "compLevel (720, 480) (30000 / 1001) (120 * 60) 128 700 = 361.5448" 361.5448 r1
                assertEqual "compLevel (352, 288) 25 (120 * 60) 128 700 = 88.466" 88.466 r2
                  where r1 = compLevel (720, 480) (30000 / 1001) (120 * 60) 128 700
                        r2 = compLevel (352, 288) 25 (120 * 60) 128 700

tests :: Test
tests = TestList [TestLabel "testMagComp1000" testMagComp1000,
                  TestLabel "testMagComp15" testMagComp15,
                  TestLabel "testMagComp05" testMagComp05,
                  TestLabel "testApproxEq" testApproxEq,
                  TestLabel "testApproxEq'" testApproxEq',
                  TestLabel "testApproxZero" testApproxZero,
                  TestLabel "testCompLevel" testCompLevel]

main :: IO Counts
main = runTestTT tests
