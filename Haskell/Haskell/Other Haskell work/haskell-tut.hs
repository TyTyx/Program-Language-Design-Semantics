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

-- 43:03

-----------------------------------------------------------------------
