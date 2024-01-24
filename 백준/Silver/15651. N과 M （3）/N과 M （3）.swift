let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var nums: [Int] = []
var str: String = ""

func dfs() {
    if nums.count == m {
       str += nums.map { String($0) }.joined(separator: " ")
        str += "\n"
        return
    }
        
    for i in 1...n {
        nums.append(i)
        dfs()
        nums.removeLast()
    }
}

dfs()
print(str)