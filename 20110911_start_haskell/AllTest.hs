module Main (main) where
import Test.HUnit
import MagComp
import ApproxEq

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

tests :: Test
tests = TestList [TestLabel "testMagComp1000" testMagComp1000,
                  TestLabel "testMagComp15" testMagComp15,
                  TestLabel "testMagComp05" testMagComp05,
                  TestLabel "testApproxEq" testApproxEq,
                  TestLabel "testApproxEq'" testApproxEq',
                  TestLabel "testApproxZero" testApproxZero]

main :: IO Counts
main = runTestTT tests
