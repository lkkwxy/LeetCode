//
//  516. 最长回文子序列.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/15.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
//s[i][j] = s[i + 1]s[j - 1] + 2
func longestPalindromeSubseq(_ s: String) -> Int {
    let chars = s.utf8CString.dropLast()
    let count = chars.count
    var dp = Array(repeating: Array(repeating: 0, count: count), count: count)
    for i in 0..<count {
        dp[i][i] = 1
    }
    for i in stride(from:count - 1, to: -1, by: -1) {
        for j in i + 1..<count {
            if chars[i] == chars[j] {
                dp[i][j] = dp[i + 1][j - 1] + 2
            } else {
                dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
            }
        }
    }
    return dp[0][count - 1]
}
