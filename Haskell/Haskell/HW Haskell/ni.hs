returnSum :: Int -> [Int] -> [Int] -> Int -> Int
returnCarry :: Int -> [Int] -> [Int] -> Int -> Int
startAdding :: Int -> [Int] -> [Int] -> Int -> [Int]

sumOfMult :: Int -> [Int] -> Int -> Int -> Int
carryMult :: Int -> [Int] -> Int -> Int -> Int
multByScalar :: Int -> [Int] -> Int -> Int -> [Int]
multiplyOut :: Int -> [Int] -> [Int] -> [Int]
oneByOne :: Int -> [Int] -> [Int] -> Int -> [Int]
startMul :: Int -> [Int] -> [Int] -> Int -> [Int]

plus :: Int -> [Int] -> [Int] -> [Int]

returnSum base x y carry = mod (head x + head y + carry) base
returnCarry base x y carry = quot (head x + head y + carry) base
startAdding base x y carry
 | x == [] && y == [] = if carry == 0 then [] else carry : []
 | x == [] = returnSum base [0] y carry : startAdding base x (tail y) (returnCarry base [0] y carry)
 | y == [] = returnSum base x [0] carry : startAdding base (tail x) y (returnCarry base x [0] carry)
 | otherwise = returnSum base x y carry : startAdding base (tail x) (tail y) (returnCarry base x y carry)

plus base x y = startAdding base x y 0


times :: Int -> [Int] -> [Int] -> [Int]

sumOfMult base x y carry = mod (head x * y + carry) base
carryMult base x y carry = quot (head x * y + carry) base

multByScalar base x y carry
 | x == [] = if carry == 0 then [] else carry : []
 | otherwise = sumOfMult base x y carry : multByScalar base (tail x) y (carryMult base x y carry)

multiplyOut base x y
 | y == [] = []
 | otherwise = plus base (multByScalar base x (head y) 0) (multiplyOut base (0:x) (tail y))

oneByOne base x y index = drop index (multiplyOut base (take (index + 1) x) (take (index + 1) y))

startMul base x y index
 | (oneByOne base x y index) == [] = []
 | otherwise = (head (oneByOne base x y index)) : startMul base x y (index + 1)

times base x y = startMul base x y 0
