//
//  27. 移除元素.swift
//  LeetCode
//
//  Created by 李坤 on 2021/4/19.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var count = nums.count - 1
    for i in stride(from: count, to: -1, by: -1) {
        if nums[i] == val {
            (nums[i], nums[count]) = (nums[count], nums[i])
            count -= 1
        }
    }
    return count + 1
}
