class TreeNode: Equatable {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }

    static func == (_ lhs: TreeNode, _ rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val &&
        lhs.left == rhs.left &&
        lhs.right == rhs.right
    }

    static func bfsPrint(_ node: TreeNode?) {
        guard let node = node else { return }
        var queue: [TreeNode] = []
        queue.append(node)

        while !queue.isEmpty {
            let topNode = queue.removeFirst()
            print(topNode.val)

            if let leftNode = topNode.left {
                queue.append(leftNode)
            }
            if let rightNode = topNode.right {
                queue.append(rightNode)
            }
        }
    }
}

class BSTIterator {
    var root: TreeNode?
    init(_ root: TreeNode?) {
        self.root = root
    }
    
    func next() -> Int {
        //basebase 
        if root.next == nil {
            root = root.next
        }
    }
    
    func hasNext() -> Bool {
        
    }
}


let node = TreeNode(
     7,
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


let bstIterator = BSTIterator(node)


