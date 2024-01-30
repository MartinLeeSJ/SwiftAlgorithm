let testCaseCount: Int = Int(readLine()!)!

var answer: String = ""

for _ in 0..<testCaseCount {
    let nodeCount: Int = Int(readLine()!)! //16
    var parent: [Int] = (0...nodeCount).map{ $0 }
    var visitedParents: [Bool] = Array(repeating: false, count: nodeCount + 1)

    @discardableResult
    func findParents(_ x: Int) -> Int {
        guard !visitedParents[x] else {
            return x
        }
        
        visitedParents[x] = true
        
        if parent[x] == x {
          return x
         }
        
         parent[x] = findParents(parent[x])
         return parent[x]
    }
    
    
    for _ in 0..<(nodeCount - 1) {
        let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        let a = input[0], b = input[1]
        parent[b] = a
    }
    
    let inputToFindSameParents: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let A = inputToFindSameParents[0], B = inputToFindSameParents[1]
    findParents(A)
    answer += "\(findParents(B))\n"
    
}

print(answer)