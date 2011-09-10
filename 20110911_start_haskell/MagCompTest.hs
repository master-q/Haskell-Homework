module Main (main) where
import Test.HUnit
import qualified MagComp as MC

testMagComp1000 :: Test
testMagComp1000 =
  TestCase $ assertEqual "magComp 9 7 = 1000.0" 1000.0 r
  where r = MC.magComp 9 7

testMagComp15 :: Test
testMagComp15 =
  TestCase $ assertEqual "magComp 7.0 6.2 = 15.848943" 15.848943 r
  where r = MC.magComp 7.0 6.2

testMagComp05 :: Test
testMagComp05 =
  TestCase $ assertEqual "magComp 6.8 7.0 = 1000.0" 0.50118756 r
  where r = MC.magComp 6.8 7.0

tests :: Test
tests = TestList [TestLabel "testMagComp1000" testMagComp1000,
                  TestLabel "testMagComp15" testMagComp15,
                  TestLabel "testMagComp05" testMagComp05]

main :: IO Counts
main = runTestTT tests
