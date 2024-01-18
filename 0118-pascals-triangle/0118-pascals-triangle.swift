class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle: [[Int]] = (0..<numRows).map { Array(repeating: 0, count: $0 + 1)}

        for row in 0..<triangle.count {
            let halfOfRowSize: Double = Double(row + 1) / Double(2)
            let limit: Int = Int(ceil(halfOfRowSize))
            for col in 0..<limit {
                if col == 0 { 
                    triangle[row][col] = 1 
                    continue
                }
                
                triangle[row][col] = triangle[row - 1][col - 1] + triangle[row - 1][col]
            }
            
            let appendLimit: Int = (row + 1) % 2 == 0 ? Int(limit) : Int(limit) - 1
            let forward: Array<Int> = Array(triangle[row][0..<Int(limit)])
            let backward: Array<Int> = Array(triangle[row][0..<appendLimit].reversed())

            triangle[row] = forward + backward
        }
        
        return triangle
        
      
    }
}