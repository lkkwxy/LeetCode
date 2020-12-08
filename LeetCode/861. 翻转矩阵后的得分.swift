//
//  861. 翻转矩阵后的得分.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/7.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func matrixScore(_ A: [[Int]]) -> Int {
    guard A.count > 0 && A[0].count > 0 else {
        return 0
    }
    let m = A.count
    let n = A[0].count
    var res = m * Int(truncating: NSDecimalNumber(decimal: pow(2.0, n - 1)))
    for i in 1..<n {
        var zeroCount = 0
        for j in 0..<m {
            if (A[j][0] == 1 && A[j][i] == 0) || (A[j][0] == 0 && A[j][i] == 1) {
                    zeroCount += 1
            }
        }
        res += max(zeroCount, m - zeroCount) * Int(truncating: NSDecimalNumber(decimal: pow(2.0, n - i - 1)))
    }
    return res
}
