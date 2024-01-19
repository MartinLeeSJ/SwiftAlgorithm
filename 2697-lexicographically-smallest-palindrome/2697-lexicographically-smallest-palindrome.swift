class Solution {
    func makeSmallestPalindrome(_ s: String) -> String {
        //s를 반으로쪼개서 탐색해야한다
        var stringArray = Array(s.split(separator: ""))
        
        var start: Int = 0
        var end: Int = s.count - 1
        
        while start < end {
            let smallest = min(stringArray[start], stringArray[end])
            
            stringArray[start] = smallest
            stringArray[end] = smallest 
            
            start += 1
            end -= 1 
        }
        
        return String(stringArray.joined())
    }
}