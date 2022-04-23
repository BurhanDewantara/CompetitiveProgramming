class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for x in 0..<board.count {
            for y in 0..<board[x].count where board[x][y] != "." {
                if !isValid(board, x, y) {
                    return false
                }
            }
        }

        return true
    }

    private func isValid(_ board:[[Character]], _ x: Int, _ y: Int) -> Bool {
        let currentValue = board[x][y]
        for idx in 0..<9 {
            if idx != y && board[x][idx] == currentValue { return false }
            if idx != x && board[idx][y] == currentValue { return false }
            
            let newX = ((x/3) * 3) + idx % 3 //0 3 6
            let newY = ((y/3) * 3) + idx / 3 //0 3 6
            if newX == x && newY == y { continue }
            
            if board[newX][newY] == currentValue { return false }
        }
        return true
    }
}

let board: [[Character]] =
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

Solution().isValidSudoku(board)
