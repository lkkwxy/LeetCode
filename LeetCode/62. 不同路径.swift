//
//  62. 不同路径.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/9.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
    for i in 1..<m {
        for j in 1..<n {
            dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
        }
    }
    return dp[m - 1][n - 1]
}
// 大量重复计算会超时
func uniquePaths1(_ m: Int, _ n: Int) -> Int {
    if m == 1 || n == 1 {
        return 1
    }
    return uniquePaths(m - 1, n) + uniquePaths(m, n - 1)
}
