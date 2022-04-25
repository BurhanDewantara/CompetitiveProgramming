// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    var arr: IndexingIterator<Array<Int>>
    var current: Int?
    
    init(_ arr: IndexingIterator<Array<Int>>) {
        self.arr = arr
        current = self.arr.next()
    }
    
    func next() -> Int {
        let returnValue = current
        current = arr.next()
        return returnValue!
    }
    
    func peek() -> Int {
        return current!
    }
    
    func hasNext() -> Bool {
        return current != nil
    }
}

//OR

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */

let iterator = PeekingIterator(.init(_elements:[1,2,3]))
