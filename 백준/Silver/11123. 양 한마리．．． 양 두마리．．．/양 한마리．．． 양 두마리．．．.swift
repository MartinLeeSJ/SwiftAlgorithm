let T = Int(readLine()!)!
var answer = ""
let grass: String = "."
let sheep: String = "#"

let dx = [1, -1, 0, 0], dy = [0,0,1,-1]



func bfs() {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let H = input.first!
    let W = input.last!
    
    var count = 0
    
    var visited = Array(repeating: Array(repeating: false, count: W + 1), count: H + 1)
    var field = Array(repeating: Array(repeating: "", count: W + 1), count: H + 1)
    
    for h in 1...H {
        field[h] = [""] + Array(readLine()!).map{String($0)} 
    }
    
    for h in 1...H {
        for w in 1...W {
            guard visited[h][w] == false else { continue }
            if field[h][w] == sheep {
                count += 1
                var queue: [(Int,Int)] = [(h,w)]
                var index = 0
                while index < queue.count {
                    let (ch, cw) = queue[index]
                    for i in 0..<4{
                        let nh = ch + dy[i]
                        let nw = cw + dx[i]
                        guard (0...H).contains(nh) && (0...W).contains(nw) else { continue }
                        guard visited[nh][nw] == false else { continue }
                         visited[nh][nw] = true
                        if field[nh][nw] == sheep {
                            queue.append((nh,nw))
                        }
                    }
                    index += 1
                }
            }
        }
    }
    answer += "\(count)\n"
}

for _ in 0..<T {
  bfs()
}

print(answer)