//
//  738. 单调递增的数字.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/15.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func monotoneIncreasingDigits(_ N: Int) -> Int {
    guard N > 9 else {
        return N
    }
    var nums = [Int]()
    var n = N
    while n != 0 {
        nums.append(n % 10)
        n = n / 10
    }
    nums = nums.reversed()
    let count = nums.count
    var res = 0
    var index = count
    for i in 1..<count {
        if nums[i - 1] > nums[i] {
            var j = i - 1
            while j >= 1 && nums[j] - 1 < nums[j - 1] {
                j -= 1
            }
            index = j
            break
        }
    }
    for i in 0..<index {
        res = res * 10 + nums[i]
    }
    if index != count {
        res = res * 10 + nums[index] - 1
        for _ in index + 1..<count {
            res = res * 10 + 9
        }
    }
    return res
}
