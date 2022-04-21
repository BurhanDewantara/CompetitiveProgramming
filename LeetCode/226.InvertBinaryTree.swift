class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        var left = invertTree(root.left)
        var right = invertTree(root.right)
        

        return root
    }

    
}



let node = TreeNode(
     100,
    TreeNode(50, TreeNode(25), TreeNode(75)),
    TreeNode(150, TreeNode(125), TreeNode(175))
  )


extension TreeNode {
    func leftFirst() {
        print("leftFirst : \(val)")
        left?.leftFirst()
        right?.leftFirst()
    }
    
    func leftSecond() {
        left?.leftSecond()
        print("leftSecond : \(val)")
        right?.leftSecond()
    }

    func leftThird() {
        left?.leftThird()
        right?.leftThird()
        print("leftThird : \(val)")
    }
    
    func rightFirst() {
        print("rightFirst : \(val)")
        right?.rightFirst()
        left?.rightFirst()
    }
    
    func rightSecond() {
        right?.rightSecond()
        print("rightSecond : \(val)")
        left?.rightSecond()
    }

    func rightThird() {
        right?.rightThird()
        left?.rightThird()
        print("rightThird : \(val)")
    }
}

func bfs(_ node: TreeNode?, _ stack: inout [TreeNode]) {
        guard let node = node else { return }

        stack.append(node)
        if let left = node.left {
            stack.append(left)
        }
        if let right = node.right {
            stack.append(right)
        }
        print(stack.map{ $0.val } )

        bfs(node.left, &stack)
        bfs(node.right, &stack)
        
        
}

var nodeStack = [TreeNode]()
bfs(node, &nodeStack)



/*
             r
            100
      l
      50            150
   l
  25      75    125     175
*/


