let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], r = input[2]

// [false, true, true, true, true, false ]
var visited: [Bool] = Array(repeating: false, count: n + 1)
var visitedIndexes: [Int] = Array(repeating: 0, count: n + 1)
// [0, 1, 2, 4, 3, 0]

var graph = [[Int]](repeating: [Int](), count: n + 1)
for _ in 0..<m {
   let relation = readLine()!.split(separator: " ").map { Int($0)! }
    let first = relation.first!, last = relation.last!
    graph[first].append(last)
    graph[last].append(first)
}
             
for i in 1...n {
    graph[i].sort()
}
             
var order: Int = 1
             
             
func bfs(start: Int) {
    visited[start] = true
    visitedIndexes[start] = order
    
    var queue: [Int] = []
    var index: Int = 0
    
    queue.append(start)
    
    while queue.count > index {
        let node: Int = queue[index]

        for vertex in graph[node] {
            if !visited[vertex] {
                visited[vertex] = true
                order += 1
                visitedIndexes[vertex] = order
                queue.append(vertex)
            }
        }
        index += 1
    }
}

bfs(start: r)

for num in 1...n {
    print("\(visitedIndexes[num])")
}


