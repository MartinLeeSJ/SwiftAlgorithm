let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var array = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by:<)
var answer = array.reduce(0, +)

for i in 0..<m {
    let merged = array[0] + array[1]
    answer += merged
    array[0] = merged
    array[1] = merged
    array.sort(by: <)
}

print(answer)
