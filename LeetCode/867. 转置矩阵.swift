//
//  867. 转置矩阵.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/25.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func transpose(_ matrix: [[Int]]) -> [[Int]] {
    let row = matrix.count
    let column = matrix[0].count
    var res = Array(repeating: Array(repeating: 0, count: row), count: column)
    for i in 0..<row {
        for j in 0..<column {
            res[j][i] = matrix[i][j]
        }
    }
    return res
}
