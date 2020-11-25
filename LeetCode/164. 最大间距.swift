//
//  164. 最大间距.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/26.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func maximumGap(_ nums: [Int]) -> Int {
    guard nums.count > 1  else { return 0 }
    let nums = nums.sorted()
    var res = 0
    for i in 0..<nums.count-1 {
        res = max(res,nums[i + 1] - nums[i])
    }
    return res
}
