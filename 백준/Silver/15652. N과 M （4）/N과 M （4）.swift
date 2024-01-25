let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var array: [Int] = []
var str: String = ""

func dfs(currentNum: Int) {
    if array.count == m {
        str += array.map { String($0) }.joined(separator: " ")
        str += "\n"
        return
    }

    for i in currentNum...n {
        array.append(i)
        dfs(currentNum: i )
        array.removeLast()
    }
}

dfs(currentNum: 1)
print(str)
