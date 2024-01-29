let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var parent = [Int](0...n)

func findParent(_ x: Int) -> Int {
    // 자기 자신이 부모이면  자기자신을 리턴
    if parent[x] == x {
        return x
    }
    
    parent[x] = findParent(parent[x])
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let parentA = findParent(a)
    let parentB = findParent(b)

    // 둘이 부모가 같다는 건 이미 연결되어 있다는 뜻이다.
    if  parentA == parentB {
        return
    }
    
    if parentA > parentB {
        parent[parentA] = parentB
    } else {
        parent[parentB] = parentA
    }
}

func isSameParent(_ a: Int, _ b: Int) -> Bool {
    return findParent(a) == findParent(b)
}


var answer = ""

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let isUnion = input[0] == 0, a = input[1], b = input[2]
    
    if isUnion {
        union(a, b)
    } else {
        answer += isSameParent(a,b) ? "YES\n" : "NO\n"
    }
}

print(answer)
