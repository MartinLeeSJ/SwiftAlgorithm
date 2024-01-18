class Solution {
    private var memories = [Int:Int]()


    func countBits(_ n: Int) -> [Int] {
        var base: Int = 1
        return (0...n).map { index in 

        if index <= 1 {
            memories[index] = index
            return index
        }

        if base * 2 == index {
            memories[index] = 1
            base *= 2
            return 1
        }

        if let memory = memories[index % base] {
            memories[index] = memory + 1
            return memory + 1
        }

        return 0

        }
    }
}