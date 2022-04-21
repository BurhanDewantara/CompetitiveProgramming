
func moveToTheLeft(_ nums: [Int]) -> [Int] {

    var zeroCount = 0
    var nums = nums.filter({ num in
        if num == 0 {
            zeroCount += 1
            return false
        }
        return true
    })

    nums = Array(repeating: 0, count: zeroCount) + nums

    return nums
}

print (moveToTheLeft([0,4,2,3,4,5,0,5,6,7,8,9,0]))

