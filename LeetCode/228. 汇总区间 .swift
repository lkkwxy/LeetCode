//
//  228. 汇总区间 .swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/10.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func summaryRanges(_ nums: [Int]) -> [String] {
    guard nums.count > 1 else {
        if nums.count == 1 {
            return ["\(nums[0])"]
        } else {
            return []
        }
    }
    var res = [String]()
    var start = nums[0]
    for i in 1..<nums.count {
        if nums[i] != nums[i - 1] + 1  {
            if start == nums[i - 1] {
                res.append("\(start)")
            } else {
                res.append("\(start)->\(nums[i - 1])")
            }
            start = nums[i]
        }
    }
    if nums[nums.count - 1] == nums[nums.count - 2] + 1{
        res.append("\(start)->\(nums[nums.count - 1])")
    } else {
        res.append("\(nums[nums.count - 1])")
    }
    return res
}
