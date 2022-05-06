class Solution {
    func minStickers(_ stickers: [String], _ target: String) -> Int {
        var memo: [String: Int] = [:]
        var targetDict: [Character: Int] = [:]
        var stickerDict: [String: [Character: Int]] = [:]

        for letter in target {
            targetDict[letter, default:0] += 1
        }

        for sticker in stickers {
            let dict = [Character: Int] = [:]
            for letter in target {
                dict[letter, default:0] += 1
            }
            stickerDict[sticker] = dict
        }

        return canConstruct(targetDict, stickers, &memo)
    }
    
    func canConstruct(_ targetDict: [Character: Int], _ stickerDict: [String: [Character: Int]], _ memo: inout: [String: Int]) -> Int {
        if isEmpty(targetDict) {
            return 0
        }
    }


    private func toString(_ dict: [Character: Int]) -> String { 
        return dict.map{ String($0.0) }.joined()
    }

    private func isEmpty(_ dict: [Character: Int]) -> Bool {
        dict.forEach({ (key, value) in
            if value > 0 {
                return false
            }
        }) 
        return true
    }

    // func minStickers(_ stickers: [String], _ target: String) -> Int {
    //     var memo: [String: Int] = [:]
    //     return canConstruct(target, stickers, &memo)
    // }
    // 
    // func canConstruct(_ target: String, _ stickers: [String], _ memo: inout [String: Int]) -> Int {
    //     //base case 
    //     if let found = memo[target] {
    //         return found
    //     }

    //     if target.isEmpty {
    //         return 0
    //     }

    //     //general case 
    //     var minResult = Int.max
    //     for sticker in stickers {
    //         var target = target
    //         var isFound = false
            
    //         for letter in sticker {
    //             if let index = target.firstIndex(of: letter) {
    //                 target.remove(at:index)
    //                 isFound = true
    //             }
    //         }

    //         if isFound {
    //             let result = canConstruct(target, stickers, &memo)
    //             if result != -1 {
    //                 memo[target] = result
    //                 minResult = min(result + 1, minResult)
    //             }
    //         }
    //     }

    //     return minResult == Int.max ? -1 : minResult
    // }
}




let sets = [
    (
        stickers: ["and","pound","force","human","fair","back","sign","course","sight","world","close","saw","best","fill","late","silent","open","noon","seat","cell","take","between","it","hundred","hat","until","either","play","triangle","stay","separate","season","tool","direct","part","student","path","ear","grow","ago","main","was","rule","element","thing","place","common","led","support","mean"],
        target: "quietchord",
        output: 4
    ),
    (
        stickers: ["as","ic", "base"],
        target: "basicbasic",
        output: 4
    ),
    (
        stickers: ["bsi","bsic", "c", "a"],
        target: "basicbasic",
        output: 4
    ),
    (
        stickers: ["bsi","basic", "c", "a"],
        target: "basicbasic",
        output: 2
    ),
    (
        stickers: ["with","example","science"],
        target: "thehat",
        output: 3
    ),
    (
        stickers: ["notice","possible"],
        target: "basicbasic",
        output: -1
    ),
]
let rightTick = "\u{2713}"
let wrongTick = "\u{2717}"

for (index, (stickers, target, output)) in sets.enumerated() {
    let actual = Solution().minStickers(stickers, target)
    let tick = actual == output ? rightTick : wrongTick
    
    print ("case \(index+1): \(tick) ; \(actual), \(output)" )
}

