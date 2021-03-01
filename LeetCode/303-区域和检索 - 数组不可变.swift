//
//  303.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/19.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
class NumArray {
    var sumNums: [Int]
    init(_ nums: [Int]) {
        sumNums = [Int](repeating: 0, count: nums.count)
        if nums.count > 0 {
            sumNums[0] = nums[0]
            for i in 1..<nums.count {
                sumNums[i] = sumNums[i - 1] + nums[i]
            }
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if i == 0 {
            return sumNums[j]
        } else {
            return sumNums[j] - sumNums[i - 1]
        }
    }
}
