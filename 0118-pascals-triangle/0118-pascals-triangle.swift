class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        // 1 부터 numRows까지 순회한다
        // numRows 길이의 [[Int]]() 를 생성한다.
        // 1번째는 시작은 무조건 [[1]]
        // 2번째까지 [[1,1]]을 넣는 거로 한다
        // 3번째 부터는 바로 전 인덱스의 결과를 보고 절반까지의 결과를 계산 (왜냐하면 대칭이기때문에)
        // 어떻게 계산? 0번째 인덱스는 무조건 1, 1번째 인덱스는 바로전 인덱스의 저장된 거를 바탕으로 0번째 인덱스값과 합해서 더해준다
        // 다음 인덱스도 반복한다 절반까지 도달할때까지
        
        var result = (0..<numRows).map { index in 
                                        Array(repeating: 0, count: index + 1)
                                       
            }
        
        
      
        
        for row in 0..<result.count {
            let half: Double = Double(row + 1) / 2.0
            let limit: Double = (row + 1) % 2 == 0 ? half : ceil(half)
            for col in 0..<Int(limit) {
                if col == 0 { 
                    result[row][col] = 1 
                    continue
                }
                
                result[row][col] = result[row - 1][col - 1] + result[row - 1][col]
            }
            
            let appendLimit: Int = (row + 1) % 2 == 0 ? Int(limit) : Int(limit) - 1
            let appendArraySlice: ArraySlice<Int> = result[row][0..<Int(limit)] + Array(result[row][0..<appendLimit].reversed())
            result[row] = Array(appendArraySlice)
        }
        
        return result
        
      
    }
}