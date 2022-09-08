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


class Solution {
    func tree2str(_ root: TreeNode?) -> String {
        // base case
        guard let value = root?.val else { return "" }
        // general case

        let valueStr = String(value)
        let leftValue = tree2str(root?.left)
        let rightValue = tree2str(root?.right)

        var composedString = valueStr
        if !leftValue.isEmpty {
            composedString += "(" + leftValue + ")"
        }
        if !rightValue.isEmpty {
            if leftValue.isEmpty {
                composedString += "()"    
            }
            composedString += "(" + rightValue + ")"
        }

        return composedString
    }
}

let node = TreeNode(1,
    .init(2, nil, .init(4)),
    .init(3)
)


print (Solution().tree2str(node))

/*
Input: root = [1,2,3,4]
Output: "1(2(4))(3)"
Explanation: Originally, it needs to be "1(2(4)())(3()())", but you need to omit all the unnecessary empty parenthesis pairs. And it will be "1(2(4))(3)"
        1
    2       3
4

*/