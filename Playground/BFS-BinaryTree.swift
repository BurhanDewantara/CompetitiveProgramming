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


func bfs(_ node: TreeNode?) -> [Int] {
    guard let node = node else { return [] }
    var vals: [Int] = []
    var queue: [TreeNode] = []
    queue.append(node)
    

    while !queue.isEmpty {
        let topNode = queue.removeFirst()
        vals.append(topNode.val)

        if let leftNode = topNode.left {
            queue.append(leftNode)
        }
        if let rightNode = topNode.right {
            queue.append(rightNode)
        }
    }
    return vals    
}

print (bfs(node))

