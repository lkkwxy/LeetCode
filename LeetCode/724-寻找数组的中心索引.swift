//
//  724-寻找数组的中心索引.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/1/2.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func pivotIndex(_ nums: [Int]) -> Int {
    let sum = nums.reduce(0) { $0 + $1}
    let count = nums.count
    var leftSum = 0
    var rightSum = sum
    var index = 0
    var ans = -1
    while index < count{
        if leftSum == rightSum - nums[index] {
            ans = index
            break
        }
        leftSum += nums[index]
        rightSum -= nums[index]
        index += 1
    }
    return ans
}
