   
   
   
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    let stack = Stack(count: k)
    var res = [Int]()
    for i in 0..<k {
        stack.add(num: nums[i])
    }
    res.append(stack.top())
    for i in k..<nums.count {
        stack.pop(num: nums[i - k])
        stack.add(num: nums[i])
        res.append(stack.top())
    }
    return res
}

class Stack {
    var count: Int
    var array = [Int]()
    var startIndex = 0
    init (count: Int) {
        self.count = count
    }
    
    func add(num: Int) {
        if array.count == 0 {
            array.append(num)
            return
        }
        var index = startIndex
        for i in stride(from: array.count - 1, to: startIndex - 1, by: -1) {
            if num <= array[i] {
                index = i + 1
                break
            }
        }
        array.replaceSubrange(index..<array.count, with:[num])
        if array.count > count + startIndex {
            startIndex += 1
        }
    }
    
    func top() -> Int {
        return array[startIndex]
    }
    
    func pop(num: Int) {
        if array[startIndex] == num {
            startIndex += 1
        }
    }
}

