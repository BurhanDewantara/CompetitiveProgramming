func mergeOverlapping(_ pairs: [(Int, Int)]) ->(Int, Int) {
    var minLeft = Int.max
    var maxRight = Int.min
    for pair in pairs {
        minLeft = min(pair.0, minLeft)
        maxRight = max(pair.1, maxRight)
    }

    return (minLeft, maxRight)
}

let result = mergeOverlapping([
    (1,2),
    (7,7),
    (2,6),
    (4,10),
    (6,11),
    (0,8),
    (12,4),
])

print(result)