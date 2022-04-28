class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomNoteDict: [Character: Int] = [:]
        var magazineDict: [Character: Int] = [:]
        
        for letter in ransomNote {
            ransomNoteDict[letter, default:0] += 1
        }
        
        for letter in magazine {
            magazineDict[letter, default:0] += 1
        }
        
        for (key, value) in ransomNoteDict {
            if let magazineValue = magazineDict[key], magazineValue >= value {
                continue
            } else {
                return false
            }
        }
        
        return true
    }
}