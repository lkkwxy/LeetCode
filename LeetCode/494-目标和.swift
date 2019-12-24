//
//  494-目标和.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/24.
//  Copyright © 2019 李坤坤. All rights reserved.
//
//[494-目标和](https://leetcode-cn.com/problems/target-sum/)
import Foundation

//解法1
func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
    guard S <= 1000 else { return 0 }
    var sumWayCounts = Array(repeating: Array(repeating: 0, count: 2001), count: nums.count)
    var set = Set<Int>()
    for (index,value) in nums.enumerated() {
        if index == 0 {
            sumWayCounts[0][value + 1000] = 1
            sumWayCounts[0][1000 - value] += 1
            set.insert(value + 1000)
            set.insert(1000 - value)
        }else {
            var tmp = Set<Int>()
            for j in set {
                sumWayCounts[index][j + value] += sumWayCounts[index - 1][j]
                sumWayCounts[index][j - value] += sumWayCounts[index - 1][j]
                tmp.insert(j + value)
                tmp.insert(j - value)
            }
            set = tmp
        }
    }
    return sumWayCounts.last![S + 1000]
}

//解法2
func findTargetSumWays1(_ nums: [Int], _ S: Int) -> Int {
    guard S <= 1000 else { return 0 }
    var sumWayCounts = Array(repeating: [Int:Int](), count: nums.count)
    for (index,value) in nums.enumerated() {
        if index == 0 {
            sumWayCounts[0][value] = 1
            sumWayCounts[0][-value] = (sumWayCounts[0][-value] ?? 0) + 1
        }else {
            for (key,count) in sumWayCounts[index - 1] {
                sumWayCounts[index][key + value] = (sumWayCounts[index][key + value] ?? 0) + count
                sumWayCounts[index][key - value] = (sumWayCounts[index][key - value] ?? 0) + count
            }
        }
    }
    return sumWayCounts.last![S] ?? 0
}

//解法3
func findTargetSumWays2(_ nums: [Int], _ S: Int) -> Int {
    guard S <= 1000 else { return 0 }
    var sumWayCounts = Array(repeating: Array(repeating: 0, count: 2001), count: nums.count)
    for (index,value) in nums.enumerated() {
        if index == 0 {
            sumWayCounts[0][value + 1000] = 1
            sumWayCounts[0][1000 - value] += 1
        }else {
            for (j, count) in sumWayCounts[index - 1].enumerated() where count > 0{
                sumWayCounts[index][j + value] += count
                sumWayCounts[index][j - value] += count
            }
        }
    }
    return sumWayCounts.last![S + 1000]
}

