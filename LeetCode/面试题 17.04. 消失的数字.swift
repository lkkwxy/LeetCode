//
//  面试题 17.04. 消失的数字.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/4.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func missingNumber(_ nums: [Int]) -> Int {
    return nums.count * (nums.count + 1) / 2 - nums.reduce(0, { $0 + $1 })
}
