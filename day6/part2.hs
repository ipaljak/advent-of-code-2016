import Data.List
import Data.Function
import Control.Arrow

leastFreq :: Ord a => [a] -> a
leastFreq = fst . minimumBy (compare `on` snd) . elemCnt
  where elemCnt = map (head &&& length) . group . sort

main :: IO ()
main = getContents >>= print . map leastFreq . transpose . lines
