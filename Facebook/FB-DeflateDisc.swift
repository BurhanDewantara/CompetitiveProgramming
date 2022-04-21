// Write any import statements here

/*
6 5 4 3
3,4,5
5,5,5
5,6,5
5,6,1
1,5,3,7,100

// if found arr[i] > i+1 then deflate

*/

func getMinimumDeflatedDiscCount(_ N: Int, _ R: [Int]) -> Int {
  guard R[N-1] >= N else { return -1 } 

  var left = 0
  var right = N-1
  
  var deflateCount = 0
  while left <= right {
    if R[left] >= R[left+1]{
      deflateCount += 1
    }
    
    if R[right] < R[right-1] {
      deflateCount += 1
    }


    left += 1
    right -= 1
  }
  
  return deflateCount
}

let nums = [
    ([1,2,4,5,6,7,8,3], -1),
    ([6,5,4,3], -1),
    ([3,4,5], 0),
    ([5,5,5], 2),
    ([5,6,5], 2),
    ([2, 5, 3, 6, 5], 3),
    ([5,6,1], -1),
    ([1,5,3,7,100], 2),
]

for (num, result) in nums {
    print (getMinimumDeflatedDiscCount(num.count, num), result) 
}
