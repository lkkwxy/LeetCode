//
//  1208. 尽可能使字符串相等.swift
//  LeetCode
//
//  Created by 李坤 on 2021/2/6.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
    let sChars = s.utf8CString.dropLast()
    let tChars = t.utf8CString.dropLast()
    let count = sChars.count
    var left = 0
    var right = 0
    var cost = 0
    var res = 0
    while right < count {
        let curCost = Int(abs(tChars[right] - sChars[right]))
        if cost + curCost > maxCost {
            res = max(res, right - left)
            left += 1
            if right < left {
                right = left
            }
            if cost != 0 {
                cost -= Int(abs(tChars[left] - sChars[left]))
            }
        } else {
            right += 1
            cost += curCost
        }
    }
    return max(res, right - left)
}
