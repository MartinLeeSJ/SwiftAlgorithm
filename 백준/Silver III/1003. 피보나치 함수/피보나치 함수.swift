let N = Int(readLine()!)!

var dp = [(Int, Int)](repeating: (0, 0), count: 41)
dp[0] =  (1, 0)
dp[1] = (0, 1)

var answer = ""

for i in 0..<N  {
   let input = Int(readLine()!)!
   if input == 0 {
       answer += "1 0\n"
       continue
   }
    
   if input == 1 {
       answer += "0 1\n"
       continue
   }
    
   for j in 2...input {
       dp[j].0 = dp[j - 1].0 + dp[j - 2].0
       dp[j].1 = dp[j - 1].1 + dp[j - 2].1
   }
   
    answer += "\(dp[input].0) \(dp[input].1)\n" 
}

print(answer)