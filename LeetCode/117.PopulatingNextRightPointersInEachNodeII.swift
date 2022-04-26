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


/*
            1
    2               3
4     5                 7
*/

//BFS
class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var stack: [Node] = [root]

        while !stack.isEmpty {
            var levelStack:[Node] = []
            var previousNode: Node? = nil
            for node in stack {
                if let leftNode = node.left { 
                    levelStack.append(leftNode) 
                }
                if let rightNode = node.right { 
                    levelStack.append(rightNode) 
                } 
                if let previousNode = previousNode { previousNode.next = node }
                previousNode = node
            }
            stack = levelStack
        }
        return root
    }
}

var node: Node? = nil
node = Node.create([1,2,3,4,5,nil,7], node)
let result = Solution().connect(node)

// OTHER way
// class Solution {
//     func connect(_ root: Node?) -> Node? {
//         let height = getHeight(root)
//         var results: [Node] = []
//         for index in 0..<height {
//             let nodes = connectNext(root, index)
            
//             var previousNode: Node? = nil
//             for eachNode in nodes {
//                 previousNode?.next = eachNode
//                 previousNode = eachNode
//             }
//             results += nodes
//         }

//         return results.first
//     }

//     func connectNext(_ root: Node?, _ level: Int) -> [Node] {
//         //base case
//         guard let root = root else { return [] }

//         if level == 0 {
//             return [root]
//         }

//         let left = connectNext(root.left, level-1 )
//         let right = connectNext(root.right, level-1 )

//         return left+right
//     }

//     func getHeight(_ root: Node?) -> Int {
//         //base case 
//         guard let root = root else { return 0 }
        
//         //general case
//         let leftHeight = getHeight(root.left)
//         let rightHeight = getHeight(root.right)

//         return max(leftHeight, rightHeight) + 1
//     }
// }

// var node: Node? = nil
// node = Node.create([1,2,3,4,5,nil,7], node)



