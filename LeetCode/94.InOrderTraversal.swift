class TreeNode {
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
}

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        //base case 
        guard let root = root else { return [] }

        return inorderTraversal(root.left) + [root.val] + inorderTraversal(root.right)
    }
}

let nums = [7, 3, 15, nil, nil, 9, 20]
var root: TreeNode?
root = TreeNode.create(nums, root)
let result = Solution().inorderTraversal(root)
print(result)
