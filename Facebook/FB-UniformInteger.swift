// Write any import statements here
import Foundation

// 1 - 100
// 1 2 3 4 5 6 7 8 9
// 11 22 33 44 55 66 77 88 99
// 111 222 333 444 555 666 777 888 999
// 1111 2222 3333 4444 5555 6666 7777 8888 9999

func getUniformInteger(_ num: Int, _ includeSelf: Bool = false) -> Int {
    let digits = String(num).count
    let bareMinUniformIntegers = (digits - 1) * 9

    let base = Int(Array(repeating:"1", count: digits).joined())!
    let additionalUniformInteger: Int = Int(floor(Double(num) / Double(base)))
    print ("mod : \(num) \(base) \(num % base)")

    let hasRemainder = num % base == 0
    let extra = includeSelf && hasRemainder ? 1 : 0 

    return bareMinUniformIntegers + additionalUniformInteger - extra
}

func getUniformIntegerCountInInterval(_ A: Int, _ B: Int) -> Int {
    if A == B {
        let digits = String(A).count
        let base = Int(Array(repeating:"1", count: digits).joined())!
        return A % base == 0 ? 1 : 0
    }
    return getUniformInteger(B) - getUniformInteger(A, true)
}

// print(getUniformInteger(98))
// print(getUniformInteger(111))
print(getUniformIntegerCountInInterval(99, 110))