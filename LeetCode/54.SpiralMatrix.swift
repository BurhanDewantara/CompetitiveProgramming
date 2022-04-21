class Solution {
    enum Direction {
        case right
        case down
        case left
        case up
    }

    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var left = 0
        var top = 0
        var right = matrix[0].count-1
        var bottom = matrix.count-1

        var x = 0
        var y = 0
        var direction: Direction = .right
        var arr: [Int] = []
        
        while true {
            switch direction {
                case .right:
                    if x <= right {
                        arr.append(matrix[y][x])
                        x += 1
                    } else {
                        direction = .down
                        top += 1

                        y = top
                        x = right
                    }

                case .down:
                    if y <= bottom {
                        arr.append(matrix[y][x])
                        y += 1
                    } else {
                        direction = .left
                        right -= 1
                        
                        y = bottom
                        x = right
                    }

                case .left:
                    if x >= left {
                        arr.append(matrix[y][x])
                        x -= 1
                    } else {
                        direction = .up
                        bottom -= 1

                        y = bottom
                        x = left
                    }

                case .up:
                    if y >= top {
                        arr.append(matrix[y][x])
                        y -= 1
                    } else {
                        direction = .right
                        left += 1

                        y = top
                        x = left
                    }
            }    
            if left > right || top > bottom {
                break
            }
            
        }
        return arr
    }
}

print (
    Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
)


