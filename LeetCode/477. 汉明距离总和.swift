//
//  477. 汉明距离总和.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/7.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func totalHammingDistance(_ nums: [Int]) -> Int {
    var bitCounts = Array(repeating: 0, count: 30)
    for num in nums {
        var n = num
        var i = 0
        while n != 0 {
            bitCounts[i] += (n % 2)
            n /= 2
            i += 1
        }
    }
    var distance = 0
    let count = nums.count
    for bitCount in bitCounts {
        distance += (count - bitCount) * bitCount
    }
    return distance
}
