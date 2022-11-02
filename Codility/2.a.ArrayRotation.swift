import Foundation
class Solution {
    public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
        var newInt = A  
        let count = A.count
        for n in 0..<count {
            let newIndex = (n+K) % count
            newInt[newIndex] = A[n] 
        }
        return newInt
    }
}
var arr = [1,2,3,4]
print (Solution().solution(&arr, 1))
