import Foundation
class Solution {
    public func solution(_ A : inout [Int]) -> Int {
    var dict: [Int: Int] = [:]
    for n in A {
        if dict[n] == 1 {
            dict.removeValue(forKey: n)
        } else {
            dict[n, default:0] += 1
        }
    }
    return dict.first!.key
    }

}
var arr = [1,2,3,4,3,2,1]
print (Solution().solution(&arr))
