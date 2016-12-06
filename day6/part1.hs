import Data.List
import Data.Function
import Control.Arrow

mostFreq :: Ord a => [a] -> a
mostFreq = fst . maximumBy (compare `on` snd) . elemCnt
  where elemCnt = map (head &&& length) . group . sort

main :: IO ()
main = getContents >>= print . map mostFreq . transpose . lines
