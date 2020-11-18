//
//  134. 加油站 .swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/18.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var startIndex = 0
    var gasSum = 0
    var gasDeficit = 0
    for i in 0..<gas.count {
        let difference = gas[i] - cost[i]
        if difference + gasSum >= 0 {
            gasSum += difference
        } else {
            startIndex = i + 1
            gasDeficit += difference + gasSum
            gasSum = 0
        }
    }
    return gasDeficit + gasSum >= 0 ? startIndex : -1
}

func canCompleteCircuit1(_ gas: [Int], _ cost: [Int]) -> Int {
    var differences = Array(repeating: 0, count: gas.count)
    var sum = 0
    for (index, value) in gas.enumerated() {
        let difference = value - cost[index]
        sum += difference
        differences[index] = difference
    }
    guard sum >= 0 else {
        return -1
    }
    for i in 0..<gas.count {
        sum = 0
        var isBreak = false
        for j in i..<differences.count {
            sum += differences[j]
            if sum < 0 {
                isBreak = true
                break
            }
        }
        if !isBreak {
            for j in 0..<i {
                sum += differences[j]
                if sum < 0 {
                    isBreak = true
                    break
                }
            }
        }
        if !isBreak {
            return i
        }
    }
    return -1
}
