class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        return 0
    }
}


let sets = [
    (
        points: [[0,0],[2,2],[3,10],[5,2],[7,0]], 
        output: 20
    ),
    (
        points: [[3,12],[-2,5],[-4,1]], 
        output: 18
    )
]

for (points, output) in sets {
    let actual = Solution().minCostConnectPoints(points)
    print (actual, output)
}

