-- Taken from Derek Banas video.

-- In the Command line:
-- Type: 'ghci'

-- :l <filename>
-- :r

-- :l - loads file | :r - runs everything.

-----------------------------------------------------------------------

import Data.List
import System.IO

-- Int -2^63 2^63.
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Int, Float, Double, Boolean.

-- Get the sum of numbers from 1 -> 1000.
sumOfNums = sum[1..1000]
-- Inside the [] brackets, a list of numbers is generated.

modEx = mod 5 4
modEx2 = 5 `mod` 4

negNumEx = 5 + (-4)
-- Haskell needs () brackets for working with negative numbers.

num9 = 9 :: Int
sqrtOf9 = sqrt(fromIntegral num9)
-- fromIntegral needed as 'sqrt' works in Float.

-- :t (+)
-- (+) :: Num a => a -> a -> a
-- Num - Int, Double or Float.

-----------------------------------------------------------------------

-- Lists [Singlely-linked in Haskell].

primeNumbers = [3,5,7,11]
morePrime = primeNumbers ++ [13,17,19,23,29]

favNums = 2 : 7 : 21 : 66 : []
-- Another way of combining numbers in a list.

mulList = [[3,5,7],[11,13,17]]
-- Multiply Lists together.

morePrimes2 = 2 : morePrime
lenPrime = length morePrimes2 -- Get the length of the lsit.
revPrime = reverse morePrimes2 -- Reverse the list.
isListEmpty = null morePrimes2 -- Check if the list is empty.
secondPrime = morePrimes2 !! 1 -- Get the second element in a list.
firstPrime = head morePrimes2 -- Get the first element in the list.
lastPrime = last morePrimes2 -- Get the last element in the list.
primeInit = init morePrimes2 -- Prints everything in the list par the last element.
first3Primes = take 3 morePrimes2 -- Prints first three elements of list.
removedPrimes = drop 3 morePrimes2 -- Removes the first three elements in the list.
is7InList = 7 `elem` morePrimes2 -- Returns True | False based on whether the value is in the list.
maxPrime = maximum morePrimes2 -- Returns maximum value in list.
minPrime - minimum morePrimes2 -- Returns minimum value in list.

newList = [2,3,5]

prodPrimes = product newList
-- Get the product of a list.

zeroToTen = [0..10]
-- Generates a list from 0 -> 10.

evenList = [2,4..20]
-- Generates a list of even numbers from 2 -> 20.

letterList = ['A','C'..'Z']
-- Output: ACEGIKMOQSUWY

many2s = take 10 (repeat 2)
-- Generates ten '2's in a list.

many3s = replicate 10 3
-- Same as many2s.

cycleList = take 10 (cycle [1,3,3,4,5])

listTimes2 = [x * 2 | x <- [1..10]]
-- Prints out multiples of two from the given range.
listTimes3 = [x * 3 | x <- [1..10], x*3 <= 50]
-- Prints out multiples of three that are less than 50.
divisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` == 9]
-- Prints out numbers that are divisible by '13' AND '9'.
-- divisBy9N13_Output: [117,234,351,468]

sortedList = sort [9,1,8,3,4,7,6]
-- Prints out a sorted list.

sumOfList = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]
-- Calculates the sum of two lists using 'zipWith'.

listBiggerThen5 = filter (>5) morePrime
evensUpTo20 = takeWhile (<= 20) [2,4..]

multOfList = foldl (*) [1,2,3,4,5]
-- Multiples list from left to right.

-- foldl: Left -> Right.
-- foldr: Right -> Left.

-- List Comprehension

pow3List = [3^n | n <- [1..10]]
-- Prints the powers of three from 1 -> 10.

-----------------------------------------------------------------------

-- Tuple
-- Tuples can contain different data types, unlike lists.

randTuple = (1, "Random Tumple")

bobSmith = ("Bob Smith", 52)

bobName = fst bobSmith -- Prints 'Bob Smith'.
bobAge = snd bobSmith -- Prints '52'.

names = ["Bob", "Mary", "Tom"]
addresses = ["123 Main", "234 North", "567 South"]
namesNAddress = zip names addresses -- Combines the lists names and addresses together, i.e. makes a tuple.

-----------------------------------------------------------------------

-- Functions.

 main do
    putStrLn "What's your name: "
    name <- getLine
    putStrLn ("Hello: " ++ name)

addMe :: Int -> Int -> Int
-- funcName param1 param2 = operations (returned value)
-- funcName cannot be named with a capital letter.

addMe x y = x + y

sumMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)

whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You're an adult"
whatAge x = "Nothing important" -- An underscore could be used instead of the 'x'.

-- Recursion.

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-----------------------------------------------------------------------

isOdd :: Int -> Boolean
isOdd n
    n `mod` 2 == 0 = False
    otherwise = True

whatGrade :: Int -> String
whatGrade age
    (age >= 5) && (age <= 6) = "kindergarten"
    (age > 6) && (age <= 10) = "elementary"
    (age > 10) && (age <= 14) = "middle"
    (age > 14) && (age <= 18) = "high"
    otherwise "Go to college"

batAvgRating :: Double -> Double -> String
batAvgRating hots atBats
    | avg <= 0.200 = "Terrible Batting Average"
    | avg <= 0.250 = "Average Player"
    | avg <= 0.280 = "Your doing pretty good"
    | otherwise = "You're a Star!"
    where avg = hits / atBats

-- batAvgRating 20 100
-- "Terrible Batting Average"
-- batAvgRating 30 100
-- "You're a Star!"

-----------------------------------------------------------------------

getListItems :: [Int] -> String
getListItems [] = "Your list is empty."
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The 1st item is " ++ show x " and the rest are " ++ show xs
-- xs: The rest of the items in the list.

getFirstItem :: String -> String
getFirstItem [] = "Your list is empty"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ [x]

-----------------------------------------------------------------------

-- Higher Order Functions.

times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs -- Recursive.

-- [1,2,3,4] : x = 1 | xs = [2,3,4]
-- [2,3,4] : x = 2 | xs = [3,4]
-- [3,4] : x = 3 | xs = [4]
-- [4] : x = 4 | xs = []

areStringsEq = [Char] -> [Char] -> Boolean
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False

-- Pass a function into a function.
-- Using time4 example.

times4 :: Int -> Int
times4 x = x * 4

doMult :: (Int -> Int) -> Int
doMult func = func 3
num3Times4 = doMult time4 -- Returns 12.

-- Return a function.

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y
adds3 = getAddFunc 3
fourPlus3 = adds3 4 -- Gives value of 7.

threePlusList = map adds3 [1,2,3,4,5] -- Gives [4,5,6,7,8].

-----------------------------------------------------------------------

-- Lambdas.

dbl1To10 = map (\x -> x * 2) [1..10]

-----------------------------------------------------------------------

-- Conditions.

-- < Less than.
-- > Greater than.
-- <= Less than or equal to.
-- >= Greater than or equal to.
-- == Equal to.
-- /= Not equal to.

doubleEvenNum y = 
    if (y `mod` 2 /= 0)
        then y
        else y * 2#

getClass :: Int -> String
getClass n = case n of 
    5 -> "Go to kindergarden"
    6 -> "Go to elementary"
    _ -> "Go away"

-----------------------------------------------------------------------

-- Inumerated types.

data BaseballPlayer = Pitcher
                    | Catcher
                    | Infielder
                    | Outfield
                deriving Show

barryBonds :: BaseballPlayer -> Bool
barryBonds Outfield = True

barryInOF = print(barryBonds Outfield)
-- True.

-----------------------------------------------------------------------

-- Custom Types.

data Customer = Customer String Double Double
    deriving Show

tomSmith :: Customer
tomSmith = Customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

-- *Main> getBalance tomSmith
-- 20.5

data RPS = Rock | Paper | Scissors
shoot :: RPS -> RPS -> String

shoot Paper Rock = "Paper beats Rock"
shoot Rock Scissors = "Rock beats Scissors"
shoot Scissors Paper = "Scissors beats Paper"
shoot Scissors Rock = "Scissors loses to Rock"
shoot Paper Scissors = "Paper loses to Scissors"
shoot Rock Paper = "Rock loses to Paper"
shoot _ _ = "Error"

data Shape = Circle Float Float Float | Rectangle Float Float
    deriving Show

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x y x2 y2) = (abs $ x2 - x) * (abs $ y2 - y)

sumValue = putStrLn (show (1 + 2))
sumValue2 = putStrLn . show $ 1 + 2

areaOfCirle = area (Circle 50 60 20)
areaOfRect = area $ Rectangle 10 10 100 100

-----------------------------------------------------------------------

-- Type Classes

-- (+) , works with Num types.
-- (+) :: Num a => a -> a -> a.

data Employee = Employee {name :: String,
                          position :: String,
                          idNum :: Int
                          } deriving (Eq, Show)

samSmith = Employee {name = "Sam Smith", position = "Manager", idNum = 1000}
pamMarx = Employee {name = "Pam Marx", position = "Sales", idNum = 1001}

isSamPam = samSmith == pamMarx -- Returns False.

samSmithData = show samSmith -- Prints out all of the data from Sam Smith.

data ShirtSize = S | M | L
instance Eq ShirtSize where
    S == S = True
    M == M = True
    L = L = True
    _ == _ = False

instance Show ShirtSize where
    show S == "Small"
    show M == "Medium"
    show L == "Large"

smallAvail = S `elem` [S,M,L]
theSize = show S

-- *Main> theSize
-- "Small"

-- *Main> smallAvail
-- True

class MyEq a where
    areEqual :: a -> a -> Bool

data ShirtSize = S | M | L
instance MyEq ShirtSize where
    areEqual S S = True
    areEqual M M = True
    areEqual L L = True
    areEqual _ _ = False

newSize = areEqual M M -- True.

-----------------------------------------------------------------------

-- IO

sayHello = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn $ "Hello " ++ name

writeToFile = do
    theFile <- openFile "test.txt" WriteMode
    hPutStrLn theFile ("Random line of text")
    hClose theFile

readFromFile = do
    theFile2 <- openFile "test.txt" ReadMode
    contents <- hGetContents theFile2
    putStr contents
    hClose theFile2

-----------------------------------------------------------------------

fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]

fib300 = fib !! 300

-- *Main> take 20 fib
-- Prints out the first twenty fib numbers in a list.

-----------------------------------------------------------------------
