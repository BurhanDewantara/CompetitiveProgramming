class TreeNode: Equatable {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }

    static func create(_ array: [Int?], _ root: TreeNode?, _ index: Int = 0) -> TreeNode? {
        // base case 
        guard index < array.count, let val = array[index] else { return root }

        // general case
        let newNode = TreeNode(val)
        newNode.left = TreeNode.create(array, newNode.left, 2 * index + 1)
        newNode.right = TreeNode.create(array, newNode.right, 2 * index + 2)
        return newNode
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


/*
            1
    2               3
4     5                
*/

var root: TreeNode? = nil

root = TreeNode.create([1,2,3,4,5], root)

TreeNode.bfsPrint(root)