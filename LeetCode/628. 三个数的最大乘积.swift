//
//  628. 三个数的最大乘积.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/20.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func maximumProduct(_ nums: [Int]) -> Int {
    let sortNums = nums[0...2].sorted()
    var min1 = sortNums[0]
    var min2 = sortNums[1]
    var max1 = sortNums[2]
    var max2 = sortNums[1]
    var max3 = sortNums[0]
    
    for i in 3..<nums.count {
        let num = nums[i]
        if num < min1 {
            min2 = min1
            min1 = num
        } else if num < min2 {
            min2 = num
        }
        if num > max1 {
            max3 = max2
            max2 = max1
            max1 = num
        } else if num > max2 {
            max3 = max2
            max2 = num
        } else if num > max3 {
            max3 = num
        }
    }
    if min1 < 0 && min2 < 0 && max1 > 0 {
        return max(min1 * min2 * max1, max1 * max2 * max3)
    } else {
        return max1 * max2 * max3
    }
}
