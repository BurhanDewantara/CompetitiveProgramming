class Solution {
    class Stack {
        let char: Character 
        var count: Int = 1 
        init (_ char: Character) {
            self.char = char    
        }

        func toString () -> String {
            return (0..<count).map{ _ in return String(char) }.joined()
        }
    }

    func removeDuplicates(_ s: String, _ k: Int) -> String {
        let arr = Array(s)
        var stack: [Stack] = [Stack(arr[0])]

        for i in 1..<arr.count {
            let currentString = arr[i]
            if stack.last?.char == currentString {
                stack.last?.count += 1
            } else {
                stack.append(Stack(currentString))
            }

            if stack.last?.count == k {
                stack.removeLast()
            }
        }
        
        return stack.reduce("") { (current, next) in
            return current + next.toString()
        }
    }
}

let sets = [
    (
        string: "abcd",
        k: 2,
        output: "abcd"
    ),
    (
        string: "deeedbbcccbdaa",
        k: 3,
        output: "aa"
    ),
    (
        string: "pbbcggttciiippooaais",
        k: 2,
        output: "ps"
    ),

]
let rightTick = "\u{2713}"
let wrongTick = "\u{2717}"

for (index, (string, k, output)) in sets.enumerated() {
    let actual = Solution().removeDuplicates(string, k)
    let tick = actual == output ? rightTick : wrongTick
    
    print ("case \(index+1): \(tick) -- \(actual), \(output)" )
}

