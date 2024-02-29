func solution() {
    let N = Int(readLine()!)!

    var dp: [Int] = Array(repeating: 0, count: N + 1)

    if N == 1 {
        print(3)
        return
    } 
    
    if N == 2 {
        print(7)
        return
    } 
    dp[1] = 3
    dp[2] = 7

    for i in (3...N) {
        dp[i] = (2 * dp[i-1] + dp[i-2]) % 9901
    }
    
    print(dp[N] % 9901)
}

solution()

