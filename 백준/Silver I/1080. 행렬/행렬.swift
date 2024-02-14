import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var changeableBoard = [[Int]](repeating: [], count: N)
var targetBoard = [[Int]](repeating: [], count: N)
var count = 0

for i in 0..<N*2 {
    let row = readLine()!.map { Int(String($0))! }
    if i < N {
        changeableBoard[i] = row
    } else {
        targetBoard[i-N] = row
    }
}

func reverseBoard(_ board: inout [[Int]], _ row: Int, _ col: Int) {
    for r in row..<row+3 {
        for c in col..<col+3 {
            board[r][c] = board[r][c] == 0 ? 1 : 0
        }
    }
}

func changeBoard() {
    if N < 3 || M < 3 { return }
    
    for r in 0..<N-2 {
        for c in 0..<M-2 {
            if changeableBoard[r][c] != targetBoard[r][c] {
                reverseBoard(&changeableBoard, r, c)
                count += 1
            }
            
            if c == M - 3 {
                for i in M-3..<M {
                    if changeableBoard[r][i] != targetBoard[r][i] { return }
                }
            }
            
        }
    }
}

func solution() {
    changeBoard()
    if changeableBoard == targetBoard {
        print(count)
    } else {
        print(-1)
    }
}

solution()





