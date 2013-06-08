import System.IO
import System.Process
import System.Environment
import System.Exit

import Archimedes.Sequence.Clarify
import Archimedes.Tasking.Replace

contChange :: (Eq a) => [[a]] -> ([a],[a]) -> [[a]]
contChange x (a,b) = map (\c -> if c `contains` a then b else c) x

main = do
  (a:b:c:_) <- getArgs
  file <- openFile a ReadWriteMode
  fileContents <- hGetContents file

  if (not (or (map ((flip contains) b) (lines fileContents)))) then exitSuccess else return ()
  
  let list = contChange (lines fileContents) (b,c)
  system ("writeSlave " ++ a ++ " " ++ (replaceList (unlines list) ("\n"," ")))
  
