//
//  1389. 按既定顺序创建目标数组.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/21.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
    var res = [Int]()
    for i in 0..<nums.count {
        res.insert(nums[i], at: index[i])
    }
    return res
}
