//
//  1283. 使结果不超过阈值的最小除数.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/22.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
    var min = 1
    var max = 1
    var than = false
    var result = 0
    while min <= max {
        let dividend = than ? (min + max) / 2 : max
        let res = nums.reduce(0) { $0 + ($1 + dividend - 1) / dividend}
        if res <= threshold {
            max = than ? dividend - 1 : max + max
            result = dividend
        } else if res > threshold {
            min = dividend + 1
            than = true
        }
    }
    return result
}
