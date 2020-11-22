//
//  283. 移动零.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/19.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func moveZeroes(_ nums: inout [Int]) {
    var zeroCount = 0
    for i in 0..<nums.count {
        if nums[i] == 0 {
            zeroCount += 1
        } else {
            nums[i - zeroCount] = nums[i]
        }
    }
    for i in nums.count-zeroCount..<nums.count {
        nums[i] = 0
    }
}
