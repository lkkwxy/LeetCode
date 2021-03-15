//
//  54. 螺旋矩阵.swift
//  LeetCode
//
//  Created by 李坤 on 2021/3/15.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    let m = matrix.count
    let n = matrix[0].count
    let end = (min(m, n) - 1) / 2
    var res = [Int]()
    for i in 0...end {
        for j in i...n - 1 - i {
            res.append(matrix[i][j])
        }
        if i + 1 <= m - i - 1 {
            for j in i + 1...m - i - 1 {
                res.append(matrix[j][n - 1 - i])
            }
        }
        if n - 2 - i >= i && m - 1 - i  > i {
            for j in stride(from: n - 2 - i, to: i - 1, by: -1) {
                res.append(matrix[m - 1 - i][j])
            }
        }
        if n - 1 - i > i {
            for j in stride(from: m - 2 - i, to: i, by: -1) {
                res.append(matrix[j][i])
            }
        }
    }
    return res
}
