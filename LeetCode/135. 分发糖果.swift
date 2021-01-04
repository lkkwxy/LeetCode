//
//  135. 分发糖果.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/24.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func candy(_ ratings: [Int]) -> Int {
    var res = 1
    var isDown = true
    var downCount = 1
    var maxValue = 1
    for i in 1..<ratings.count {
        if isDown {
            if ratings[i] > ratings[i - 1] {
                downCount = 1
                isDown = false
                maxValue = 2
                res += 2
            } else if ratings[i] == ratings[i - 1] {
                downCount = 1
                maxValue = 1
                res += 1
            } else {
                downCount += 1
                if downCount > maxValue {
                    res += downCount
                } else {
                    res += downCount - 1
                }
            }
        } else {
            downCount = 1
            if ratings[i] > ratings[i - 1] {
                maxValue += 1
                res += maxValue
            } else if ratings[i] == ratings[i - 1] {
                maxValue = 1
                res += 1
                isDown = true
            } else {
                isDown = true
                downCount = 2
                if downCount > maxValue {
                    res += downCount
                } else {
                    res += downCount - 1
                }
            }
        }
    }
    return res
}
