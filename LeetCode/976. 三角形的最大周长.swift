//
//  976. 三角形的最大周长.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/30.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func largestPerimeter(_ A: [Int]) -> Int {
    if A.count < 3 {
        return 0
    }
    let nums = A.sorted { $0 > $1 }
    for i in 2..<nums.count {
        if nums[i] + nums[i - 1] > nums[i - 2] {
            return nums[i] + nums[i - 1] + nums[i - 2]
        }
    }
    return 0
}
