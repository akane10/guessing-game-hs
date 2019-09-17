import           System.Random
import           Text.Read

guessLoop :: Int -> Int -> IO ()
guessLoop _ 0 = putStrLn "Too bad you're out of life"
guessLoop num life = do
  putStrLn "Please input your guess"
  putStrLn $ "remain life: " ++ show life
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
  putStrLn "Guess the number!"
  num <- randomRIO (0, 100)
  guessLoop num 7
