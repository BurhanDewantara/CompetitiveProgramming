class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var y = 0
        var x = matrix[0].count - 1

        while (x >= 0 && y < matrix.count) {
            let val = matrix[y][x]
            if target == val {
                return true
            }

            if target > val {
                y += 1
            } else {
                x -= 1
            }
        }
        return false
    }
}


/*
[1,  4,  7,  11, 15]
[2,  5,  8,  12, 19]
[3,  6,  9,  16, 22]
[10, 13, 14, 17, 24]
[18, 21, 23, 26, 30]
*/

let sets = [
    (
        matrix: [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]],
        target: 5,
        output: true
    ),
    (
        matrix: [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]],
        target: 20,
        output: false
    )
]

for (matrix, target, output) in sets {
    let actual = Solution().searchMatrix(matrix, target)
    print (actual, output)
}

