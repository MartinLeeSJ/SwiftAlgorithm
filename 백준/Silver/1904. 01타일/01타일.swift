let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)

if n >= 1 {
  dp[1] = 1
}

if n >= 2 {
dp[2] = 2
}

if n >= 3 {
 for i in 3..<n+1 {
     dp[i] = (dp[i - 1] + dp[i - 2]) % 15746
 }
}

print(dp[n])

