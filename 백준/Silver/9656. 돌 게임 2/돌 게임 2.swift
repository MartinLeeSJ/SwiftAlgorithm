let N = Int(readLine()!)!
let numOfThree = Int(N / 3)
let rest = N % 3

if (numOfThree + rest).isMultiple(of: 2) {
    print("SK")
} else {
    print("CY")
}