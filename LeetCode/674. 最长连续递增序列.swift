//
//  674. 最长连续递增序列.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/24.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findLengthOfLCIS(_ nums: [Int]) -> Int {
    var length = 1
    var maxLength = 1
    for i in 1..<nums.count {
        if nums[i] > nums[i - 1] {
            length += 1
        } else {
            maxLength = max(length, maxLength)
            length = 1
        }
    }
    return max(length, maxLength)
}
