/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

 //PERFECT BINARY TREE

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var stack: [Node] = [root]

        while !stack.isEmpty {
            var levelStack: [Node] = []
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
