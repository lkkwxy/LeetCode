//
//  561. 数组拆分 I.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/19.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func arrayPairSum(_ nums: [Int]) -> Int {
    var nums = nums
    nums.sort{$0 < $1}
    var sum = 0
    for i in stride(from: 0, to: nums.count, by: 2) {
        sum += nums[i]
    }
    return sum
}
