//
//  63. 不同路径 II.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/9.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    guard obstacleGrid.count > 0 else {
        return 0
    }
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    var dp = Array(repeating: 0, count: n)
    dp[0] = obstacleGrid[0][0] == 0 ? 1 : 0
    for i in 0..<m {
        for j in 0..<n {
            if obstacleGrid[i][j] == 1 {
                dp[j] = 0
                continue
            } else {
                if j > 0 {
                    dp[j] += dp[j - 1]
                }
            }
        }
    }
    return dp[n - 1]
}
func uniquePathsWithObstacles1(_ obstacleGrid: [[Int]]) -> Int {
    guard obstacleGrid.count > 0 else {
        return 0
    }
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
    dp[0][0] = obstacleGrid[0][0] == 0 ? 1 : 0
    for i in 0..<m {
        for j in 0..<n {
            if obstacleGrid[i][j] == 1 {
                dp[i][j] = 0
                continue
            } else {
                var tmp = 0
                if j > 0 {
                    tmp += dp[i][j - 1]
                }
                if i > 0 {
                    tmp += dp[i - 1][j]
                }
                if tmp > 0 {
                    dp[i][j] = tmp
                }
            }
        }
    }
    return dp[m - 1][n - 1]
}

