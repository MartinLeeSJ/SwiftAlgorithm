var input: [String] = Array(readLine()!.map{String($0)})

var center: String = ""
var answer: String = ""
var oddCount: Int = 0
var dict = [String:Int]()

for index in 0..<input.count {
    if let count = dict[input[index]] {
        dict[input[index]] = count + 1
    } else {
        dict[input[index]] = 1
    }
}

var dictArray: [(String, Int)] = dict.map { ($0.key, $0.value)}
dictArray.sort(by: { $0.0 < $1.0 })

for index in 0..<dictArray.count {
    if dictArray[index].1 % 2 != 0 {
        oddCount += 1
        if oddCount > 1 { break }
        center = dictArray[index].0
        dictArray[index].1 = dictArray[index].1 - 1
 
    } 
    
    for _ in 0..<(dictArray[index].1 / 2) {
        answer += dictArray[index].0
    }

}

if oddCount > 1 {
    print("I'm Sorry Hansoo")
} else {
    print(answer + center + String(answer.reversed()))
}










