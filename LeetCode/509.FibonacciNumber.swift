class Solution {
    func fib(_ n: Int) -> Int {
        var memo = Array(repeating: 0, count: n+1) 
        return fib(n, &memo)
    }

    func fib(_ n: Int, _ memo: inout [Int]) -> Int {
        //base case
        if n < 2 {return n}

        if memo[n] != 0 { return memo[n] }

        //general case
        memo[n] = fib(n-2, &memo) + fib(n-1, &memo)
        return memo[n]
    }
}


(1...50).forEach({
    print(Solution().fib($0))
})