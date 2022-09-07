class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var index = 0
        for num in nums {
            if num != 0 {
                nums[index] = num
                index += 1
            }
        }
        while (index < nums.count) {
            nums[index] = 0
            index+=1
        }
    }
}

var nums = [0,60,4,3,0,2,2,0]
Solution().moveZeroes(&nums)
print (nums)