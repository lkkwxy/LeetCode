//
//  665-非递减数列.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/16.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
// 解法1
func checkPossibility(_ nums: [Int]) -> Bool {
    var nums = nums
    guard nums.count > 1 else { return true }
    var changeCount = 1
    for i in 0..<nums.count-1 {
        if nums[i] > nums[i + 1] {
            if i == 0 || nums[i - 1] < nums[i + 1]{
                nums[i] = nums[i + 1]
            }else {
                nums[i + 1] = nums[i]
            }
            changeCount -= 1
            if changeCount < 0 {
                return false
            }
        }
    }
    return true
}

// 解法2
func checkPossibility1(_ nums: [Int]) -> Bool {
    guard nums.count > 1 else { return true }
    var changeCount = 1
    for i in 0..<nums.count-1 {
        if nums[i] > nums[i + 1] {
            if i != 0 && i != nums.count - 2 && nums[i - 1] > nums[i + 1] && nums[i] > nums[i + 2] {
                return false
            }
            changeCount -= 1
            if changeCount < 0 {
                return false
            }
        }
    }
    return true
}
