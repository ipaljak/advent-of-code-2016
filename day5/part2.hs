import Data.List as List
import Data.Digest.Pure.MD5
import Data.ByteString.Lazy.Char8 as BS

phrase :: String
phrase = "cxdnnyjw"

md5hash :: String -> Integer -> String
md5hash s n = show . md5 . pack $ (s ++ show n)

checkHash :: String -> Integer -> Bool 
checkHash valid n = countZeros hash >= 5 && (hash !! 5) `List.elem` valid
  where countZeros = List.length . Prelude.takeWhile (=='0') 
        hash       = md5hash phrase n

password :: String
password = List.map snd . sort . List.map (\s -> (s !! 5, s !! 6)) . List.map (md5hash phrase) . List.take 8 $ idx ['0'..'7'] 1
  where idx valid n | checkHash valid n = n:(idx (valid \\ [(md5hash phrase n) !! 5]) (n+1))
                    | otherwise         = idx valid (n+1)

main :: IO()
main = print password
