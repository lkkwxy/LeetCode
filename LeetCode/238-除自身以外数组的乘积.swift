//
//  238-除自身以外数组的乘积.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/19.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func productExceptSelf(_ nums: [Int]) -> [Int] {
    let count = nums.count
    var result = Array(repeating: 1, count: count)
    var leftProduct = 1
    var rightProduct = 1
    for i in 0..<count {
        result[i] *= leftProduct
        leftProduct *= nums[i]
        result[count - i - 1] *= rightProduct
        rightProduct *= nums[count - i - 1]
    }
    return result
}
