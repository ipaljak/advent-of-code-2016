import Data.List.Split

dx = [0, 1, 0, -1]
dy = [1, 0, -1, 0]

move :: (Int, Int, Int) -> String -> (Int, Int, Int)
move (x, y, dir) (turn:len) = (x', y', dir')
  where dir'
          | turn == 'R' = (dir + 1) `mod` 4
          | otherwise   = (dir + 3) `mod` 4
        len'            = read len :: Int
        x'              = x + len' * (dx !! dir')
        y'              = y + len' * (dy !! dir')

walk :: [String] -> Int
walk = walkFrom (0, 0, 0) 
  where walkFrom state = result . foldl move state
        result (a, b, c) = abs(a) + abs(b)

main :: IO()
main = getContents >>= print . walk . splitOn "," . filter (/=' ') . init
