import Foundation

class Solution {
    var keys: [String] = [
        "2","2","2",    //ABC
        "3","3","3",    //DEF
        "4","4","4",    //GHI
        "5","5","5",    //JKL
        "6","6","6",    //MNO
        "7","7","7","7",//PQRS
        "8","8","8",    //TUV
        "9","9","9","9",//WXYZ
    ]

    func find(_ phoneNumber: String, _ words: [String]) -> [String] {
        let wordsSet:[(String, String)] = words.map { word in 
            return (word.lowercased()
            .map{ $0.asciiValue! - Character("a").asciiValue! }
            .map{ keys[Int($0)] }
            .joined(), word)
        }

        return wordsSet.filter ({ (wordInNumber, word) in
            return phoneNumber.range(of: wordInNumber) != nil
        })
        .map { $0.1 }
    }
}

let result = Solution().find(
    "3662277",
    ["foo", "bar", "baz", "foobar", "emo", "cap", "car", "cat"]
)

print(result)