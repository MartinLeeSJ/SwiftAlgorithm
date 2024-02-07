import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: n + 1)

var array = readLine()!.split(separator: " ").map { Int($0)! }

for i in 1..<n {
    for j in 0..<i {
        if array[j] < array[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
