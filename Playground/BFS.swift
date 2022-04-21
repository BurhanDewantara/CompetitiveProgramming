class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}


/*
            100
      
      50            150
   
  25      75    125     175

1       35  

      30
*/

let node = TreeNode(
     100,
    TreeNode(50, 
        TreeNode(25, 
            TreeNode(1)), 
        TreeNode(75, 
            TreeNode(35, 
                TreeNode(30)))),
    TreeNode(150, 
        TreeNode(125), 
        TreeNode(175))
  )


func bfs(_ node: TreeNode?) -> [[Int]]{
    let height = height(node)

    var result: [[Int]] = []
    for i in 0..<height {
        result += [process(node, i)]
    }
    return result
}

func process (_ root: TreeNode?, _ level: Int) -> [Int] {
    // base case 
    guard let root = root else { return [] }
    
    if level == 0 {
        return [root.val]
    }

    // general case
    let left = process(root.left, level - 1)
    let right = process(root.right, level - 1)
    return left + right
}


func height(_ node: TreeNode?) -> Int {
    // base case
    guard let node = node else { return 0 }
    
    // general case - simplified
    return max(height(node.left), height(node.right)) + 1  

    // general case - extended
    // let leftHeight = height(node.left)
    // let rightHeight = height(node.right)

    // if leftHeight > rightHeight { 
    //     return leftHeight + 1
    // } else {
    //     return rightHeight + 1
    // }
}

// print (height(node))
print (bfs(node))

