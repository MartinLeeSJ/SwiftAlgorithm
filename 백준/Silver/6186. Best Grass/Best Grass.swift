let input = readLine()!.split(separator: " ").map { Int($0)! } 
let R = input.first!
let C = input.last!

let empty: String = "."
let clump: String = "#"

var visited = Array(repeating: Array(repeating: false, count: C + 1), count: R + 1)

var answer: Int = 0

var clumps: [[String]] = .init(repeating: Array(repeating: "", count: C + 1), count: R + 1)

for i in 1...R {
    clumps[i] = [""] + Array(readLine()!).map { String($0) }
}


for i in 1...R {
    for j in 1...C {
        guard visited[i][j] == false else {
            continue
        }
        
        defer {
            visited[i][j] = true
        }
        
        guard clumps[i][j] == clump else { continue }
        answer += 1
        let right = j == C ? "" : clumps[i][j+1]
        let below = i == R ? "" : clumps[i+1][j]
            
         if right == clump { visited[i][j+1] = true }
         if below == clump { visited[i+1][j] = true }
    }
}

print(answer)