class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        if nums.count == 1 { return false }
        
        var total = nums.reduce(0,+)
        guard total % k != 0 else {
            return true
        }
        
        var left = 0
        var right = nums.count - 1
        
        while left < right && right - left >= 2 {
            
            let leftNum = nums[left] 
            let rightNum = nums[right]
            print (total, leftNum, rightNum)
            
            if (total - leftNum) % k == 0 {
                print ("here1")
                return true
            }
            
            if (total - rightNum) % k == 0 {
                print ("here2")
                return true
            }
            
            left += 1
            right -= 1 
            total = total - (leftNum + rightNum)
        }
        
        return false
        
    }
}
print (Solution().checkSubarraySum(
    [18,373,97,499,525,170,133,376,77,279,257,168,319,335,237,36,236,41,360,131,172,279,405,236,296,377,348,411,135,411,273,230,103,274,211,427,101,243,31,485,282,40,28,81,6,318,502,521,140,110,467,248,404,107,108,129,113,113,333,83,242,194,112,446,463,102,145,107,73,47,53,455,301,150,314,13,180,119,234,509,199,503,69,224,228,427,309,497,342,329,518,35,425,343,417,509,85,234,426,334],
250
    )
) // false