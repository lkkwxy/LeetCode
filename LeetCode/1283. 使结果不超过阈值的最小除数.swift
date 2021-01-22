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
    var max = 1000000
    var result = 0
    while min <= max {
        let dividend = (min + max) / 2
        let res = nums.reduce(0) { $0 + ($1 + dividend - 1) / dividend}
        if res <= threshold {
            max = dividend - 1
            result = dividend
        } else if res > threshold {
            min = dividend + 1
        }
    }
    return result
}
