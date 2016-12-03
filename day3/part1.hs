import Data.List.Split

isTriangle :: [String] -> Bool
isTriangle (a':b':c':_) = (a + b) > c && (a + c) > b && (b + c) > a 
  where a = read a' :: Int
        b = read b' :: Int
        c = read c' :: Int

countTriangles :: [[String]] -> Int
countTriangles = length . filter isTriangle 

main :: IO ()
main = getContents >>= print . countTriangles . map words . lines 
