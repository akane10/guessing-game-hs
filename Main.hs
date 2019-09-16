import           System.Random
import           Text.Read

guessLoop :: Int -> IO ()
guessLoop num = do
  putStrLn "Please input your guess"
  guessed <- getLine
  -- putStrLn (show num)
  case readMaybe guessed of
    Just a -> case compare a num of
                GT -> do
                    putStrLn "too big"
                    guessLoop num
                LT -> do
                    putStrLn "too small"
                    guessLoop num
                EQ -> putStrLn "yay... you win"
    _ -> do
      putStrLn "oopss looks like it wasn't a number, was it?"
      guessLoop num

main :: IO()
main = do
  putStrLn "Guess the number!"
  num <- randomRIO (0, 100)
  guessLoop num
