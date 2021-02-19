//
//  643. 子数组最大平均数 I .swift
//  LeetCode
//
//  Created by 李坤 on 2021/2/6.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var maxSum = 0
    var curSum = 0
    for i in 0..<k {
        curSum += nums[i]
    }
    maxSum = curSum
    for i in k..<nums.count {
        curSum = curSum - nums[i - k] + nums[i]
        maxSum = max(maxSum, curSum)
    }
    return Double(maxSum) / Double(k)
}
