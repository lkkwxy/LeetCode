//
//  74-搜索二维矩阵.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/1/6.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let m = matrix.count
    guard let n = matrix.first?.count, m > 0 , n > 0 else { return false }
    var i = m - 1, j = 0
    while i >= 0 && j < n {
        if matrix[i][j] == target {
            return true
        }else if matrix[i][j] > target {
            i -= 1
        }else if matrix[i][j] < target {
            j += 1
        }
    }
    return false
}
