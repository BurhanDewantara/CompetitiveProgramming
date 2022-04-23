public class Tester {
    var testCaseNumber = 0

    func check<T: Equatable>(_ expected: T, matches actual: T) {
        let rightTick = "\u{2713}"
        let wrongTick = "\u{2717}"
            
        if expected == actual {
            print("\(rightTick) Test #\(testCaseNumber)")
        } else {
            print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expected) - Your actual: \(actual)")
        }
        testCaseNumber += 1
    }
}

