class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var memo: [String: Bool] = [:]
        return optimizedWordBreak(s, wordDict, &memo)
    }
    
    func optimizedWordBreak(_ s: String, _ wordDict: [String], _ memo: inout [String: Bool]) -> Bool {
        //base case 
        if let result = memo[s] { return result }
        if s.isEmpty { return true }

        //general case
        for word in wordDict {
            if s.hasPrefix(word) {
                let trimmedText = String(s.dropFirst(word.count))
                let result = optimizedWordBreak(trimmedText, wordDict, &memo)
                memo[trimmedText] = result
                if result {
                    return result
                }
            }
        }
        return false
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
[
    (true, Solution().wordBreak("leetcode",["leet","code"])),
    (true, Solution().wordBreak("applepen",["apple", "pen"])),
    (false, Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"])),
    (true, Solution().wordBreak("cars",["car", "ca", "rs"])),
]
.forEach({ (expected, actual) in
    tester.check(expected, matches: actual)
})
