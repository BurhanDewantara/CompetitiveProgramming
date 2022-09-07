class Solution {
    func isSorted(_ strs: [String]) -> Bool {
        for i in 0..<strs.count-1 {
            if strs[i] > strs[i+1] {
                return false
            }
        }
        return true
    }
    
    func minDeletionSize(_ strs: [String]) -> Int {
        var strs = strs
        let len = strs[0].count
        var count = 0
        
        while count < len {
            if (isSorted(strs)) {
                return count
            }
            
            strs = strs.map{ String($0.dropFirst()) }
            count += 1
        }
        
        return count
    }
}


let sets = [
    (
        strs: ["ca","bb","ac"],
        output: 1
    ),
    (
        strs: ["xc","yb","za"],
        output: 0
    ),
    (
        strs: ["zyx","wvu","tsr"],
        output: 3
    ),
    (
        strs: ["xga","xfb","yfa"],
        output: 1
    ),
]
let rightTick = "\u{2713}"
let wrongTick = "\u{2717}"

for (index, (strs, output)) in sets.enumerated() {
    let actual = Solution().minDeletionSize(strs)
    if actual == output {
        print ("case \(index+1): \(rightTick)")
    } else {
        print ("case \(index+1): \(wrongTick) -- \(actual), \(output)" )
    }
}

