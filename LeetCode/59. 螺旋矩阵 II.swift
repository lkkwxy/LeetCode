//
//  59. 螺旋矩阵 II.swift
//  LeetCode
//
//  Created by 李坤 on 2021/3/16.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func generateMatrix(_ n: Int) -> [[Int]] {
    let end = (n - 1) / 2
    var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var k = 1
    for i in 0...end {
        for j in i...n - 1 - i {
            res[i][j] = k
            k += 1
        }
        if i + 1 <= n - i - 1 {
            for j in i + 1...n - i - 1 {
                res[j][n - 1 - i] = k
                k += 1
            }
        }
        if n - 2 - i >= i && n - 1 - i  > i {
            for j in stride(from: n - 2 - i, to: i - 1, by: -1) {
                res[n - 1 - i][j] = k
                k += 1
            }
        }
        if n - 1 - i > i {
            for j in stride(from: n - 2 - i, to: i, by: -1) {
                res[j][i] = k
                k += 1
            }
        }
    }
    return res
}
