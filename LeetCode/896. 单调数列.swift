//
//  896. 单调数列.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/28.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func isMonotonic(_ A: [Int]) -> Bool {
    guard A.count > 1 else {
        return true
    }
    var res = true
    var index = 0
    var isAcc = 0
    for i in 1..<A.count {
        if A[i] > A[i - 1] {
            isAcc = 1
            index = i
            break
        } else if  A[i] < A[i - 1] {
            isAcc = -1
            index = i
            break
        }
    }
    if isAcc == 1 {
        for i in index..<A.count {
            if A[i] < A[i - 1] {
                res = false
                break
            }
        }
    } else if isAcc == -1 {
        for i in index..<A.count {
            if A[i] > A[i - 1] {
                res = false
                break
            }
        }
    }
    return res
}
