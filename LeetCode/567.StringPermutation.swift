
class Solution {
    func isAllZero(_ dict: [String:Int]) -> Bool {
        // print (dict)
        // return dict.map({ $0.value }).allSatisfy({ $0 == 0})
        for (_, value) in dict {
            if value != 0 {
                return false
            }
        }
        return true
    }

    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s2.count < s1.count { return false }

        var stringDict: [String: Int] = [:]

        let string1Arr = s1.map{String($0)}
        let string2Arr = s2.map{String($0)}

        let len1 = string1Arr.count
        let len2 = string2Arr.count

        for i in 0..<len1 {
            stringDict[string1Arr[i], default:0] += 1
            stringDict[string2Arr[i], default:0] -= 1
        }
        
        if isAllZero(stringDict) {
            return true
        }

        for i in len1..<len2 {
            stringDict[String(string2Arr[i]), default:0] -= 1
            stringDict[String(string2Arr[i - len1]), default:0] += 1

            if isAllZero(stringDict) {
                return true
            }
        }

        return false 
    }
}


print (Solution().checkInclusion(
    "dewa",
    "burhandewantara"
    )
    )


