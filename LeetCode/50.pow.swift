class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        
        var num: Double = x
        var pow = n
        if pow < 0 {
            pow = abs(pow)
            num = 1/num
        }
        
        return pow % 2 == 0 ? myPow(num * num, pow / 2) : num * myPow(num * num, pow / 2)
     }
}

print (Solution().myPow(2,-2))