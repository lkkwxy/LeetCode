//
//  35-搜索插入位置.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/7/17.
//  Copyright © 2020 李坤坤. All rights reserved.
//
///
import Foundation
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var leftIndex = 0
    var rightIndex = nums.count - 1
    var midIndex = (leftIndex + rightIndex) / 2
    var ansIndex = nums.count
    while leftIndex <= rightIndex {
        if nums[midIndex] == target {
            ansIndex = midIndex
            break
        }else if nums[midIndex] < target {
            leftIndex = midIndex + 1
        }else {
            rightIndex = midIndex - 1
            ansIndex = midIndex
        }
        midIndex = (rightIndex - leftIndex) / 2 + leftIndex
    }
    
    return ansIndex
}
