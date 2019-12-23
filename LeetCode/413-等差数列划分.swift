//
//  413-等差数列划分.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/23.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func numberOfArithmeticSlices(_ A: [Int]) -> Int {
    let count = A.count
    guard count > 2 else { return 0 }
    var result = 0
    var i = 2
    var differenceValue = A[1] - A[0]
    var sliceLength = 2
    while i < count {
        if A[i] - A[i - 1] == differenceValue {
            sliceLength += 1
        }else {
            if sliceLength > 2 {
                result += (sliceLength - 2) * (sliceLength - 1) / 2
            }
            differenceValue = A[i] - A[i - 1]
            sliceLength = 2
        }
        i += 1
    }
    if sliceLength > 2 {
        result += (sliceLength - 2) * (sliceLength - 1) / 2
    }
    return result
}
