import           System.Random
import           Text.Read

guessLoop :: Int -> Int -> IO ()
guessLoop num 0 = putStrLn $ "\nToo bad you're out of life, the secret number is " ++ show num
guessLoop num life = do
  putStrLn $ "\nRemain life: " ++ show life
  putStrLn "Please input your guess"
  guessed <- getLine
  -- putStrLn (show num)
  case readMaybe guessed of
    Just a -> case compare a num of
                GT -> do
                    putStrLn "too big"
                    guessLoop num remainLife
                LT -> do
                    putStrLn "too small"
                    guessLoop num remainLife
                EQ -> putStrLn "yay... you win"
    _ -> do
      putStrLn "oopss looks like it wasn't a number, was it?"
      guessLoop num life
  where remainLife = life - 1

main :: IO()
main = do
  putStrLn "Guess the number! Between 0 and 100"
  num <- randomRIO (0, 100)
  guessLoop num 7
