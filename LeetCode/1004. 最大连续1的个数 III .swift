//
//  1004. 最大连续1的个数 III .swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/19.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func longestOnes(_ A: [Int], _ K: Int) -> Int {
    var maxCount = K
    var left = 0
    var right = 0
    var zeroCount = 0
    while right < A.count && zeroCount < K {
        if A[right] == 0 {
            zeroCount += 1
        }
        right += 1
    }
    maxCount = max(maxCount, right)
    while right < A.count {
        while A[right] != 0 && right < A.count {
            right += 1
        }
        maxCount = max(maxCount, right - left)
        while A[left] != 0 && left < A.count{
            left += 1
        }
        left += 1
    }
    return maxCount
}
