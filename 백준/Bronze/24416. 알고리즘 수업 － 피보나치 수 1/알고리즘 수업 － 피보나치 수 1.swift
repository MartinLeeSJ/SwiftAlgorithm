let input = Int(readLine()!)!

var fiboOneCount: Int = 0
var dp = Array(repeating: 1, count: input + 1)

func fiboOne(n: Int) -> Int {
    defer {
        fiboOneCount += 1
    }
    
    guard n > 2 else {
        return 1
    }
    
    let a = dp[n - 1] == 1 ? fiboOne(n: n - 1) : dp[n - 1]
    let b = dp[n - 2] == 1 ? fiboOne(n: n - 2) : dp[n - 2]
    let result =  a + b 
    dp[n] = result
    
    return result
}


print("\(fiboOne(n: input)) \(input - 2)")


