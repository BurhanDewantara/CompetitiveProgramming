/* 
Given an array of integers nums and an integer k,
return the total number of subarrays whose sum equals to k.
Example 1:

Input: nums = [1,1,1], k = 2
Output: 2
Example 2:

Input: nums = [1,2,3], k = 3
Output: 2
*/
 
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var map: [Int: Int] = [:]
        map[0] = 1

        var cummulativeSum = 0
        var subarrayCount = 0
        for num in nums {
            cummulativeSum += num
            let remainder = cummulativeSum - k

            if let count = map[remainder] {
                subarrayCount+=count
            }
            map[cummulativeSum, default:0] += 1
        }

        return subarrayCount
    }
}

public class Tester {
    var testCaseNumber = 0

    func check<T: Equatable>(_ expected: T, matches actual: T) {
        let rightTick = "\u{2713}"
        let wrongTick = "\u{2717}"
            
        if expected == actual {
            print("\(rightTick) Test #\(testCaseNumber)")
        } else {
            print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expected) - Your actual: \(actual)")
        }
        testCaseNumber += 1
    }
}

let tester = Tester()
let solution = Solution()
[
    (2, ([1,2,3], 3)),
    (2, ([1,1,1], 2)),
    (1, ([-1,-1,1,-1,-1,1,-1], 0)),

].forEach { (expected, param) in
    tester.check(expected, matches: solution.subarraySum(param.0, param.1) )  
}


