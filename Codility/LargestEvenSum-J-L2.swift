import Foundation
class Solution {
    public func solution(_ A : inout [Int], _ K : Int) -> Int {
    guard K <= A.count, A.count > 0 else {
        return -1 
    }
    
    var oddNumbers: [Int] = []
    var evenNumbers: [Int] = []

    for number in A {
        if number % 2 == 0 {
            evenNumbers.append(number)
        } else {
            oddNumbers.append(number)
        }
    }

    evenNumbers.sort(by: >)
    oddNumbers.sort(by: >)

    if K == 1 {
        return evenNumbers.first ?? -1
    } 

    if K == 2 {
        var biggestEvens = 0
        if evenNumbers.count > 1 {
            biggestEvens = evenNumbers[0] + evenNumbers[1]
        }
        
        var biggestOdds = 0
        if oddNumbers.count > 1 {
            biggestOdds = oddNumbers[0] + oddNumbers[1]
        }
        
        if biggestEvens != 0 || biggestOdds != 0 {
            return max(biggestEvens,biggestOdds)
        } else {
            return -1
        }
    } 

    var oddIndex = 0
    var evenIndex = 0

    var total = 0
    var numberRequired = K

    while numberRequired > 0 {
        if numberRequired % 2 == 1, evenIndex < evenNumbers.count {
            total += evenNumbers[evenIndex]
            evenIndex += 1
            numberRequired -= 1
        } else {
            if evenIndex < evenNumbers.count - 1 && oddIndex < oddNumbers.count - 1 {
                let totalEven = evenNumbers[evenIndex] + evenNumbers[evenIndex+1]
                let totalOdd = oddNumbers[oddIndex] + oddNumbers[oddIndex+1]
                if totalEven > totalOdd {
                    total += totalEven
                    evenIndex += 2
                } else {
                    total += totalOdd
                    oddIndex += 2
                }
            }
            else if evenIndex < evenNumbers.count - 1 {
                total += evenNumbers[evenIndex] + evenNumbers[evenIndex+1]
                evenIndex += 2
                
            }
            else if oddIndex < oddNumbers.count - 1 {
                total += oddNumbers[oddIndex] + oddNumbers[oddIndex+1]
                oddIndex += 2
            }
            numberRequired -= 2
        }
    }
    return total
    }
}

var x = [8,8,8,2,2,7,7]

print (Solution().solution(&x, 5))
