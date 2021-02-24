//
//  766. 托普利茨矩阵.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/22.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
    let m = matrix.count
    let n = matrix[0].count
    for i in 0..<m-1 {
        let num = matrix[i][0]
        var index = 1
        while index < n && i + index < m {
            if matrix[index + i][index] != num {
                return false
            }
            index += 1
        }
    }
    if n > 2 {
        for i in 1..<n-1 {
            let num = matrix[0][i]
            var index = 1
            while index < m && i + index < n {
                if matrix[index][index + i] != num {
                    return false
                }
                index += 1
            }
        }
    }
    return true
}
