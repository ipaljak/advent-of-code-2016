import Data.List as List
import Data.Digest.Pure.MD5
import Data.ByteString.Lazy.Char8 as BS

phrase :: String
phrase = "cxdnnyjw"

md5hash :: String -> Integer -> String
md5hash s n = show . md5 . pack $ (s ++ show n)

checkHash :: Integer -> Bool 
checkHash n = countZeros (md5hash phrase n) >= 5
  where countZeros = List.length . Prelude.takeWhile (=='0') 

password :: String
password = List.map (\n -> (md5hash phrase n) !! 5) idx
  where idx = List.take 8 $ List.filter (checkHash) [1..]

main :: IO()
main = print password
