//
//  1093-大样本统计.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/1/2.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func sampleStats(_ count: [Int]) -> [Double] {
    var minValue = -1, maxValue = 0
    var maxCount = 0, maxCountValue = 0
    var sum = 0, midValue = 0.0
    var countSum = 0, countSums = [(Int,Int)]()
    for (key, value) in count.enumerated() {
        if value != 0 {
            if minValue == -1 {
                minValue = key
            }
            maxValue = key
            if value > maxCount {
                maxCount = value
                maxCountValue = key
            }
            sum += value * key
            countSums.append((countSum,key))
            countSum += value
        }
    }
    var midIndex = (-1,-1)
    if countSum % 2 == 0 {
        midIndex = (countSum / 2 - 1, countSum / 2)
    }else {
        midIndex = (countSum / 2, -1)
    }
    for (index,(countSum,key)) in countSums.enumerated() {
        if countSum > midIndex.0 {
            if midIndex.1 != -1 && countSum - midIndex.0 == 1 {
                midValue = Double(countSums[index - 1].1 + key) / 2
            }else {
                midValue = Double(countSums[index - 1].1)
            }
            break
        }
    }
    
    return [Double(minValue),Double(maxValue),Double(sum) / Double(countSum),Double(midValue),Double(maxCountValue)]
}
