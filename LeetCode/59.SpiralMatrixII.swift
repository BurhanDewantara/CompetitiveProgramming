class Solution {
    let directions:[(Int,Int)] = [
        (1,0),
        (0,1),
        (-1,0),
        (0,-1),
    ]

    func generateMatrix(_ n: Int) -> [[Int]] {
        var arr = (0..<n).map({ _ in return (0..<n).map({ _ in return 0 }) })
        
        var dirIndex = 0
        
        var x = 0
        var y = 0
        var number = 1

        while number <= n*n {
            if arr[y][x] == 0 {
                arr[y][x] = number 
                number += 1 
            } 
            
            let direction = directions[dirIndex]
            x += direction.0
            y += direction.1
            
            if direction.1 == 0 { // x moving
                if x >= n-1 || x <= 0 || arr[y][x + direction.0] != 0 { 
                    dirIndex = (dirIndex + 1) % directions.count    
                }
            } else {
                if y >= n-1 || y <= 0 || arr[y+direction.1][x] != 0 { 
                    dirIndex = (dirIndex + 1) % directions.count    
                }
            }
        } 

        return arr
    }
}

print (Solution().generateMatrix(10))

