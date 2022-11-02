import Foundation
class Solution {
    //Longest Binary Gap
    //33
    //10001 = 3
    // 100 = 64 + 32 + 16
    func binaryGap(_ number: Int) -> Int {
        let binaryString = getBinary(number)
        let longestBinaryGap = getLongestBinaryGap(binaryString: binaryString)
        return longestBinaryGap
    }

    private func getLongestBinaryGap(binaryString: String) -> Int {
        var count = 0
        var longest = 0 

        for n in binaryString {
            if n == "1" {
                longest = max(longest, count)
                count = 0
            }
            if n == "0" {
                count += 1
            }
        }

        return longest
    } 

    private func getBinary(
        _ number: Int
    ) -> String {
        guard number > 0 else {
            return "" 
        }
        let mod: Int = number % 2
        let str = String(mod)
        return  getBinary (number / 2 ) + str
    }
}


let _ = Solution().binaryGap(33)
let _ = Solution().binaryGap(1536)