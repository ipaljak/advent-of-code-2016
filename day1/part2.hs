import Data.List
import Data.List.Split

dx = [0, 1, 0, -1]
dy = [1, 0, -1, 0]

move :: (Int, Int, Int) -> String -> (Int, Int, Int)
move (x, y, dir) (turn:len) = (x', y', dir')
  where dir'
          | turn == 'R' = (dir + 1) `mod` 4
          | turn == 'L' = (dir + 3) `mod` 4
          | otherwise   = dir
        len'            = read len :: Int
        x'              = x + len' * (dx !! dir')
        y'              = y + len' * (dy !! dir')

walk :: [String] -> [(Int, Int)]
walk = walkFrom (0, 0, 0)
  where walkFrom state@(x,y,_) []     = [(x,y)]
        walkFrom state@(x,y,_) (d:ds) = (x,y):(walkFrom (move state d) ds)

solve :: [(Int, Int)] -> Int
solve l = dist . head $ l \\ (nub l)
  where dist (a,b) = abs(a) + abs(b)

parseList :: [String] -> [String]
parseList [] = []
parseList ((a:x):xs)
  | (read x :: Int) == 1 = (a:x):parseList xs
  | otherwise            = (a:"1"):(parseList (('X':(subStr x)):xs))
  where subStr s = show $ (read s :: Int) - 1 

main :: IO()
main = getContents >>= print . solve . walk . parseList . splitOn "," . filter (/=' ') . init
