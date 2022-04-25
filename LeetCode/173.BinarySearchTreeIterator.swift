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

class BSTIterator {
    var root: TreeNode?
    var nums: [Int] 
    
    init(_ root: TreeNode?) {
        self.root = root
        self.nums = [] 
        nums = inorderTraversal(root)
    }
    
    func next() -> Int {
        return nums.removeFirst()
    }
    
    func hasNext() -> Bool {
        return nums.count > 0
    }

    private func inorderTraversal(_ node: TreeNode?) -> [Int] {
        //base case 
        guard let node = node else { return [] }

        return inorderTraversal(node.left) + [node.val] + inorderTraversal(node.right)
    }
}

/*
            7
    3               15
                9       20
*/

let nums = [7, 3, 15, nil, nil, 9, 20]
var root: TreeNode?
root = TreeNode.create(nums, root)
let bstIterator = BSTIterator(root)


let result: [Any] = [
    bstIterator.next(),         // 3
    bstIterator.next(),         // 7
    bstIterator.hasNext(),      // true
    bstIterator.next(),         // 9
    bstIterator.hasNext(),      // true
    bstIterator.next(),         // 15
    bstIterator.hasNext(),      // true
    bstIterator.next(),         // 20
    bstIterator.hasNext(),      // false
]

print (result)