class Solution {
        struct Edge {
            let start: String
            let end: String
            let weight: Double 
        }

        func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
            let edges = zip(equations, values).compactMap({ (equation, value) -> ([Edge])? in

                guard let start = equation.first else { return nil }
                guard let end = equation.last else { return nil }
                
                return [
                    Edge(start: start, end: end, weight: value),
                    Edge(start: end, end: start, weight: 1/value)
                    ] 
            })
            .flatMap({ $0 })

            let routes: [String: [Edge]] = Dictionary(grouping: edges, by: { $0.start })
                        
            var distances: [Double] = []

            for query in queries {
                var visited = Set<String>()
                let distance = travelDistance(start: query[0], end: query[1], visited: &visited, routes: routes)
                distances.append(distance)
            }

            return distances
        }

        func travelDistance(start: String, end: String, visited: inout Set<String>, routes: [String: [Edge]]) -> Double {
            guard let edges = routes[start] else {
                return -1
            }

            if let edge = edges.first(where: { $0.end == end }) {
                return edge.weight
            }

            visited.insert(start)
            
            for edge in edges {
                if visited.contains(edge.end) { continue }
                let result = travelDistance(start: edge.end, end: end, visited: &visited, routes: routes) 
                if result != -1 {
                    return edge.weight * result
                }
            }

            return -1
        }
}

let result = Solution().calcEquation([["a","b"],["b","c"],["a","d"],["d","e"]], [2.0,3.0,8.0,1.0], [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]])
print(result)

