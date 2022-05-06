class Solution {
    func removeDuplicates(_ s: String) -> String {
        let arr = Array(s)
        var stack: [Character] = []

        for i in 0..<arr.count {
            let current = arr[i]
            if stack.last == current {
                stack.removeLast()
            } else {
                stack.append(current)
            }
        }

        return stack.reduce("") { (current, next) in
            return current + String(next)
        }
    }
}

let sets = [
    (
        string: "abbaca",
        output: "ca"
    ),
    (
        string: "azxxzy",
        output: "ay"
    ),
]
let rightTick = "\u{2713}"
let wrongTick = "\u{2717}"

for (index, (string, output)) in sets.enumerated() {
    let actual = Solution().removeDuplicates(string)
    let tick = actual == output ? rightTick : wrongTick
    
    print ("case \(index+1): \(tick) -- \(actual), \(output)" )
}

