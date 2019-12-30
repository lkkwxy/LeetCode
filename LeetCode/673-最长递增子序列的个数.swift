//
//  673-最长递增子序列的个数.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/30.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func findNumberOfLIS(_ nums: [Int]) -> Int {
//    1,5,4,3,6,7,7
//    1,1 2,1 2,1 2,1
//    2,1 3,1 3,2 3,3
//    4,3 4,3
//    1,2,2,2,3,4,4
//    1,1,,1,1,3,3,3
    let count = nums.count
    guard count > 1 else { return count }
    var lengths = Array(repeating: 1, count: count)
    var counts = Array(repeating: 1, count: count)
    
    for i in 1..<count {
        for j in 0..<i {
            if nums[i] > nums[j] {
                if lengths[i] == lengths[j] + 1 {
                    counts[i] += counts[j]
                }else if lengths[i] < lengths[j] + 1 {
                    lengths[i] = lengths[j] + 1
                    counts[i] = counts[j]
                }
            }
        }
    }
    var maxLength = 1
    var ans = 0
    for length in lengths {
        if maxLength < length { maxLength = length }
    }
    for (index, length) in lengths.enumerated() {
        if maxLength == length { ans += counts[index] }
    }
    return ans
}
