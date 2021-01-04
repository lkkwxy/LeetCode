//
//  659. 分割数组为连续子序列.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/27.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func isPossible(_ nums: [Int]) -> Bool {
    var countMap = [Int: Int]()
    var endMap = [Int: Int]()
    for num in nums {
        countMap[num] = (countMap[num] ?? 0) + 1
    }
    
    for num in nums where countMap[num] ?? 0 > 0 {
        if let count = endMap[num], count > 0 {
            endMap[num] = count - 1
            endMap[num + 1] = (endMap[num + 1] ?? 0) + 1
        } else if let nextNumCount = countMap[num + 1],
                  let nextNextNumCount = countMap[num + 2],
                  nextNumCount > 0,
                  nextNextNumCount > 0 {
            countMap[num + 1] = nextNumCount - 1
            countMap[num + 2] = nextNextNumCount - 1
            endMap[num + 3] = (endMap[num + 3] ?? 0) + 1
        } else {
            return false
        }
        countMap[num]! -= 1
    }
    return true
}
