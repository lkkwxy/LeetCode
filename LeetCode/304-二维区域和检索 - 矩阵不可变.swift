//
//  304.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/21.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
// [304-二维区域和检索 - 矩阵不可变](https://leetcode-cn.com/problems/range-sum-query-2d-immutable/)
class NumMatrix {
    private var sumMatrix:[[Int]] = []
    init(_ matrix: [[Int]]) {
        let m = matrix.count
        guard let n = matrix.first?.count else { return }
        sumMatrix = Array(repeating: Array(repeating: 0, count: n), count: m)
        sumMatrix[0][0] = matrix[0][0]
        for i in 1..<m {
            sumMatrix[i][0] = matrix[i][0] + sumMatrix[i - 1][0]
        }
        for j in 1..<n {
            sumMatrix[0][j] = matrix[0][j] + sumMatrix[0][j - 1]
        }
        for i in 1..<m {
            for j in 1..<n {
                sumMatrix[i][j] = matrix[i][j] + sumMatrix[i - 1][j] + sumMatrix[i][j - 1] - sumMatrix[i - 1][j - 1]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        if row1 > 0 && col1 > 0{
            return sumMatrix[row2][col2] - sumMatrix[row2][col1 - 1] - sumMatrix[row1 - 1][col2] + sumMatrix[row1 - 1][col1 - 1]
        }else if row1 > 0 { // col1 = 0
            return sumMatrix[row2][col2] - sumMatrix[row1 - 1][col2]
        }else if col1 > 0 {
            return sumMatrix[row2][col2] - sumMatrix[row2][col1 - 1]
        }else{
            return sumMatrix[row2][col2]
        }
    }
}
