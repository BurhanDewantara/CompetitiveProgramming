class Solution {
    
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        var unionFind = UnionFind(s.count)
        
        for pair in pairs {
            unionFind.union(pair[0], pair[1])
        }
        
        var disjointIndicesDict: [Int:[Int]] = [:]
        var disjointStringDict: [Int:[String]] = [:]
        
        var arrStr = s.map{ String($0) }
        for (index, str) in arrStr.enumerated() {
            let root = unionFind.find(index)
            disjointIndicesDict[root, default:[]] += [index]
            disjointStringDict[root, default:[]] += [str]
        }
        
        disjointStringDict = disjointStringDict.mapValues({ value in
            value.sorted(by: <)
        })
        
        for (root, value) in disjointIndicesDict {
            for (index, indexValue) in value.enumerated() {
                arrStr[indexValue] = disjointStringDict[root]?[index] ?? ""
            }
        }
        
        return arrStr.joined()
    }
    
    struct UnionFind {
        var root: [Int]
        var rank: [Int]
        init (_ size: Int) {
            root = [Int](0..<size)
            rank = Array(repeating: 1, count: size)
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
            
            if rank[rhsRoot] > rank[lhsRoot] {
                root[lhsRoot] = rhsRoot
            } else {
                root[rhsRoot] = lhsRoot
                rank[lhsRoot] += 1
            }
        }
    }
}