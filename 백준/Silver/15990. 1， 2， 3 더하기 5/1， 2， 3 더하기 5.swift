let T = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: 4), count: 100_001)
dp[1] = [0,1,0,0]
dp[2] = [0,0,1,0]
dp[3] = [0,1,1,1]

var answer = ""

for _ in 1...T {
    let n = Int(readLine()!)!
    if n <= 3 {
        answer += "\(dp[n].reduce(0, +))\n"
        continue
    }
    
    for i in 4...n {
        if dp[i] == [0,0,0,0] {
            dp[i][1] = (dp[i-1][2] + dp[i-1][3]) % 1_000_000_009
            dp[i][2] = (dp[i-2][1] + dp[i-2][3]) % 1_000_000_009
            dp[i][3] = (dp[i-3][1] + dp[i-3][2]) % 1_000_000_009
        }
    }
    
    answer += "\(dp[n].reduce(0, +) % 1_000_000_009)\n"
}

print(answer)
