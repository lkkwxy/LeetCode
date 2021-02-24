//
//  697. 数组的度.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/20.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findShortestSubArray(_ nums: [Int]) -> Int {
    var maxCount = 1
    var map = [Int: (Int, Int, Int)]()
    var res = nums.count
    for i in 0..<nums.count {
        if let info = map[nums[i]] {
            map[nums[i]] = (info.0 + 1,info.1,i)
            maxCount = max(maxCount, info.0 + 1)
        } else {
            map[nums[i]] = (1,i,i)
        }
    }
    for (_, value)in map {
        if value.0 == maxCount {
            res = min(res, value.2 - value.1 + 1)
        }
    }
    return res
}
