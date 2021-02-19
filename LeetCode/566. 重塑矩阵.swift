//
//  566. 重塑矩阵.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/19.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    let m = nums.count
    let n = nums[0].count
    guard r * c == m * n else {
        return nums
    }
    var res = Array(repeating: Array(repeating: 0, count: c), count: r)
    for i in 0..<m {
        for j in 0..<n {
            let index = i * n + j
            res[index / c][index % c] = nums[i][j]
            
        }
    }
    return res
}
