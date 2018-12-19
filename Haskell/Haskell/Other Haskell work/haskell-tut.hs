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
-- Prints out numbers that are either divisible by '13' AND '9'.
-- divisBy9N13_Output: [117,234,351,468]

-- 22:49
-----------------------------------------------------------------------
