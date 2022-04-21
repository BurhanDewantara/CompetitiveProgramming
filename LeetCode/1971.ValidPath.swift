class Solution {
    struct UnionFind {
        var root: [Int] = []
        var rank: [Int] = []
        var value: [Int] = []
        
        init(_ count: Int) {
            self.root = [Int](0..<count)
            self.rank = Array(repeating: 1, count: count)
            
        }
        
        mutating func find(_ node: Int) -> Int {
            if node == root[node] {
                return node
            }
            root[node] = find(root[node])
            return root[node]
        }
        
        mutating func union(_ lhs: Int, _ rhs: Int) {
            let lhsRoot = find(lhs)
            let rhsRoot = find(rhs)
            
            if lhsRoot == rhsRoot { return }
            
            if rank[lhsRoot] > rank[rhsRoot] {
                root[rhsRoot] = lhsRoot
            } else {
                root[lhsRoot] = rhsRoot
                rank[rhsRoot] += 1
            }
        }

        mutating func isConnected(_ start: Int, _ end: Int) -> Bool {
            return find(start) == find(end)
        }
    }

    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var unionFind = UnionFind(n)
        for edge in edges {
            unionFind.union(edge[0],edge[1])
        }        

        return unionFind.isConnected(source, destination)
    }
}

print( Solution().validPath(3,[[0,1],[1,2],[2,0]],0,2) )
