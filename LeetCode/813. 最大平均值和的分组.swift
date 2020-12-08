//
//  813. 最大平均值和的分组.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/3.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func largestSumOfAverages(_ A: [Int], _ K: Int) -> Double {
    if A.count == 1 {
        return Double(A[0])
    }
    if K == 1 {
        return Double(A.reduce(0) { $0 + $1}) / Double(A.count)
    }
    var ks = Array(repeating: (0.0, 1.0), count: K)
    for i in 0..<K {
        ks[i] = (Double(A[i]), 1.0)
    }
    
    for i in K..<A.count {
        var min = (K - 1,(ks[K - 1].0 * ks[K - 1].1 + Double(A[i])) / (ks[K - 1].1 + 1), ks[K - 1].1 + 1)
        for j in 0..<K - 1 {
            let curNum = (ks[j].0 * ks[j].1  + ks[j + 1].0 * ks[j + 1].1) / (ks[j].1 + ks[j + 1].1)
            if curNum < min.1 {
                min = (j, curNum, ks[j].1 + ks[j + 1].1)
            }
        }
        if min.0 == K - 1 {
            ks[K - 1] = (min.1, min.2)
        } else {
            ks[min.0] = (min.1, min.2)
            for j in min.0 + 1..<K - 1 {
                ks[j] = ks[j + 1]
            }
            ks[K - 1] = (Double(A[i]), 1)
        }
    }
    return ks.reduce(0.0) { $0 + $1.0 }
}
