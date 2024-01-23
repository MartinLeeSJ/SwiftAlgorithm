func solution() -> Int {
    // 인접해 있는 색과 같지 않아야한다.
    // 최소비용을 구해야 한다.
    let n: Int = Int(readLine()!)!
    var colors: [[Int]] = [[0, 0, 0]] + (0..<n).compactMap { _ in 
                                              readLine()
                                             }.compactMap { str in
                                               Array(str.split(separator: " ")).map { Int($0)! } 
                                             }
    var dp: [[Int]] = Array(repeating: [0, 0, 0], count: n + 1)
   
    dp[1] = colors[1]
    
    for index in 2..<n+1 {
        dp[index][0] =
        colors[index][0] + min(dp[index - 1][1], dp[index - 1][2])
        
        dp[index][1] =
        colors[index][1] + min(dp[index - 1][0], dp[index - 1][2])
        
          dp[index][2] =
        colors[index][2] + min(dp[index - 1][0], dp[index - 1][1])
    }
    
    return dp.last!.min()!
    
}

print(solution())