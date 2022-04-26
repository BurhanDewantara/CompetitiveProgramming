class Node {
    var val: Int
    var left: Node?
    var right: Node?
    var next: Node?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }

     static func create(_ array: [Int?], _ root: Node?, _ index: Int = 0) -> Node? {
        // base case 
        guard index < array.count, let val = array[index] else { return root }

        // general case
        let newNode = Node(val)
        newNode.left = Node.create(array, newNode.left, 2 * index + 1)
        newNode.right = Node.create(array, newNode.right, 2 * index + 2)
        return newNode
    }
}


var root: Node? = nil
root = Node.create([1,2,3,4,5], root)
print (root!)