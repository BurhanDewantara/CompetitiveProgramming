
class Answer {
    static func solution(_ A : inout [Int]) -> Int {
        var numberSet = Set<Int>()

        for number in A {
            if number > 0 {
                numberSet.insert(number)
            }
        }

        guard numberSet.count > 0 else {
            return 1
        }

        for num in 1...numberSet.count {
            if !numberSet.contains(num) {
                return num
            }
        }

        return numberSet.count + 1
    }
}

var arg = [-1, -3]
print(Answer.solution(&arg))