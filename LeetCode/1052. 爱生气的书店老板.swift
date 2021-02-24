//
//  1052. 爱生气的书店老板.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/23.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ X: Int) -> Int {
    var maxCount = 0
    var left = 0
    var right = X - 1
    for i in 0...right {
        if grumpy[i] == 1 {
            maxCount += customers[i]
        }
    }
    right += 1
    var curCount = maxCount
    while right < grumpy.count {
        if grumpy[left] == 1 {
            curCount -= customers[left]
        }
        if grumpy[right] == 1 {
            curCount += customers[right]
        }
        maxCount = max(maxCount, curCount)
        left += 1
        right += 1
    }
    var res = 0
    for i in 0..<grumpy.count {
        if grumpy[i] == 0 {
            res += customers[i]
        }
    }
    return res + maxCount
}
