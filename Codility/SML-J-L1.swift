import Foundation
class Solution {
    public func solution(_ T : inout String) -> String {
    var mIndex = 0
    var str = ""
    for size in T {
        switch size {
            case "S":
             str.insert("S", at: str.startIndex)
             mIndex+=1
            
            case "M":
            str.insert("M", at: str.index(str.startIndex, offsetBy: mIndex))

            case "L":
            str.insert("L", at: str.endIndex)

            default:
            break
            
        }
    }
    
    return str
    }
}

var x = "LMMLMMSSLLMMSLLMMS"
print (Solution().solution(&x))
