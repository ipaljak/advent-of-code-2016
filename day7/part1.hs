import Data.List
import Data.List.Split

containsABBA :: [String] -> Bool
containsABBA = or . map (\s -> or . map check $ zip4 s (tail s) (drop 2 s) (drop 3 s))
  where check (a,b,c,d) = a == d && b == c && a /= b

parseIP :: String -> ([String], [String])
parseIP line = (outside, inside)
  where groups     = splitOneOf "[]" line
        everyNth n = map snd . filter ((==1) . fst) . zip (cycle [1..n])
        outside    = everyNth 2 groups
        inside     = everyNth 2 $ tail groups

supportsTLS :: String -> Bool
supportsTLS s = (containsABBA outside) && (not $ containsABBA inside)
  where (outside, inside) = parseIP s 

main :: IO()
main = getContents >>= print . sum . map (fromEnum . supportsTLS) . lines 
