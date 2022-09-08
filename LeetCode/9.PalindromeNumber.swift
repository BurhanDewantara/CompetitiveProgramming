class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let str = String(x)
        let reversedStr = String(str.reversed())
        return str == reversedStr
    }
}

print (Solution().isPalindrome(123)) // false
print (Solution().isPalindrome(121)) // true
print (Solution().isPalindrome(121)) // true
