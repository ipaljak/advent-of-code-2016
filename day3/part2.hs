import Data.List
import Data.List.Split

isTriangle :: [String] -> Bool
isTriangle (a':b':c':_) = (a + b) > c && (a + c) > b && (b + c) > a 
  where a = read a' :: Int
        b = read b' :: Int
        c = read c' :: Int

countTriangles :: [String] -> Int
countTriangles [] = 0
countTriangles (a:b:c:xs)
  | isTriangle [a,b,c] = 1 + countTriangles xs
  | otherwise          = countTriangles xs

main :: IO ()
main = getContents >>= print . sum . map countTriangles . transpose . map words . lines 
