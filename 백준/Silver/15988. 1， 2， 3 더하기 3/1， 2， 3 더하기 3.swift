import Foundation

let T = Int(readLine()!)!

var dp = Array(repeating: 0, count: 1_000_001)
dp[1] = 1
dp[2] = 2
dp[3] = 4

var answer = ""

for _ in (1...T) {
    let n = Int(readLine()!)!
    
    if n <= 3 {
        answer += "\(dp[n])\n"
        continue
    }
    
    for i in (4...n) {
        if dp[i] == 0 {
           dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]) % 1_000_000_009
        }
    }
    
    answer += "\(dp[n])\n"
    
}

print(answer)