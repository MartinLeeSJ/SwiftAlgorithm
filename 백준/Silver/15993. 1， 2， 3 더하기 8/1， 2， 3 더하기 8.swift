import Foundation

let T = Int(readLine()!)!

var dp = Array(repeating: [0, 0], count: 100_001)
dp[1] = [1, 0] //홀짝
dp[2] = [1, 1]
dp[3] = [2, 2]

var answer = ""

for _ in (1...T) {
    let n = Int(readLine()!)!
    if n <= 3 {
        answer += "\(dp[n][0]) \(dp[n][1])\n"
        continue
    }
    for j in (4...n) {
        if dp[j] == [0, 0] {
            dp[j][0] = (dp[j-1][1] + dp[j-2][1] + dp[j-3][1]) % 1_000_000_009
            dp[j][1] = (dp[j-1][0] + dp[j-2][0] + dp[j-3][0]) % 1_000_000_009
        }
    }
    
    answer += "\(dp[n][0] % 1_000_000_009) \(dp[n][1] % 1_000_000_009)\n"
}

print(answer)



