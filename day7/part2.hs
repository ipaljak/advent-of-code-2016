import Data.List
import Data.List.Split

filterABA :: [String] -> [(Char, Char, Char)]
filterABA = concatMap (\s -> filter check $ zip3 s (tail s) (drop 2 s))
  where check (a,b,c) = a == c && a /= b

parseIP :: String -> ([String], [String])
parseIP line = (outside, inside)
  where groups     = splitOneOf "[]" line
        everyNth n = map snd . filter ((==1) . fst) . zip (cycle [1..n])
        outside    = everyNth 2 groups
        inside     = everyNth 2 $ tail groups

supportsSSL :: String -> Bool
supportsSSL s = (filterABA outside) `intersect` (map invert $ filterABA inside) /= []
  where (outside, inside) = parseIP s
        invert (a, b, c)  = (b, a, b)

main :: IO()
main = getContents >>= print . sum . map (fromEnum . supportsSSL) . lines 
