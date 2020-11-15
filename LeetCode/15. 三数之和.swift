//
//  15. 三数之和.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/15.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func threeSum(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var result = [[Int]]()
    for i in 0..<nums.count-2 {
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        var numj: Int?
        let sum = -nums[i]
        var j = i + 1
        var k = nums.count - 1
        while j < k {
            if nums[j] + nums[k] == sum {
                if numj == nil || numj! != nums[j] {
                    numj = nums[j]
                    result.append([nums[i], nums[j], nums[k]])
                }
                j += 1
                k -= 1
            } else if nums[j] + nums[k] > sum {
                k -= 1
            } else {
                j += 1
            }
        }
        
    }
    return result
}
