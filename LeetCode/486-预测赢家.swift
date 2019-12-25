//
//  486-预测赢家.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/25.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func PredictTheWinner(_ nums: [Int]) -> Bool {
    var map = [String:Int]()
    func differenceValue(left:Int, right:Int) -> Int{
        if left == right {
            return nums[left]
        }
        let key = "\(left)_\(right)"
        if let value = map[key] {
            return value
        }
        let value = max(nums[right] - differenceValue(left: left, right: right - 1),nums[left] -  differenceValue(left: left + 1, right: right))
        map[key] = value
        return value
    }
    return differenceValue(left: 0, right: nums.count - 1) >= 0
}
