import Foundation
class Solution {
    public func solution() {
        let availableContents = ["apple", "nice beach", "no sea here", "I'm seeing"]
        let textVariations = ["beach", "sea", "ocean"]
        let contents = availableContents.filter { availableContent in
            availableContent.count > 3 &&
            !textVariations.filter({ availableContent.contains($0) }).isEmpty
            // ($0.contains(textVariations[0]) || $0.contains(textVariations[1]) || $0.contains(textVariations[2]))
        }
        print (contents)
    }
}


print (Solution().solution())
