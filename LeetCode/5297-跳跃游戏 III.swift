//
//  5297-跳跃游戏 III.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/29.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
var canReachSet = Set<Int>()
func canReach(_ arr: [Int], _ start: Int) -> Bool {
    guard start >= 0 && start < arr.count else { return false }
    if canReachSet.contains(start) { return false }
    if arr[start] == 0 { return true }
    canReachSet.insert(start)
    return canReach(arr, start - arr[start]) || canReach(arr, start + arr[start])
}
