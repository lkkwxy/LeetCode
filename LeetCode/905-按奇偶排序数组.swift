//
//  905-按奇偶排序数组.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/1/2.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func sortArrayByParity(_ A: [Int]) -> [Int] {
    var ans = A
    var slow = 0, fast = ans.count - 1
    while (slow < fast) {
        while ans[slow] % 2 == 0 && slow < fast{
            slow += 1
        }
        while ans[fast] % 2 == 1 && slow < fast{
            fast -= 1
        }
        (ans[slow],ans[fast]) = (ans[fast],ans[slow])
        slow += 1
        fast -= 1
    }
    return ans
}
