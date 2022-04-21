class Solution {
    var routes: [String: [(String, Int)]] = [:]

    init (airports: [[String]], distances: [Int]) {
        zip(airports, distances).forEach { (airport, distance) in 
            routes[airport[0], default:[]] += [(airport[1], distance)]
            routes[airport[1], default:[]] += [(airport[0], distance)]
        }
    }

    func calcDistance(_ from: String, _ to: String) -> Int {
        var hasVisited = Set<String>()
        return travel(from, to, &hasVisited)
    }

    func travel(_ from: String, _ to: String, _ hasVisited: inout Set<String>) -> Int {
        guard let targets = routes[from] else {
            return -1
        }

        if let target = targets.first(where:{ $0.0 == to }) {
            return target.1
        }
        
        hasVisited.insert(from)
        for target in targets {
            if hasVisited.contains(target.0) { continue }
            let distance = travel(target.0, to, &hasVisited)
            if distance != -1 {
                return target.1 + distance
            }
        }

        return -1
    }
}

let solution = Solution(
    airports:[
        ["CGK","BDG"],
        ["CGK","SBY"],
        ["BDG","MDN"],
        ["SBY","BAL"],
        ["SGP","BKK"],
    ],
    distances: [
        4,
        2,
        3,
        4,
        5,
    ]
)

let results = [
    solution.calcDistance("CGK", "BAL"), //  CGK - SBY - BAL = 2 + 4 = 6 
    solution.calcDistance("BAL", "MDN"), //  BAL - SBY - CGK - BDG - MDN = 4 + 2 + 4 + 3 = 13
    solution.calcDistance("SGP", "CGK"), //  -1
]

print (results)


