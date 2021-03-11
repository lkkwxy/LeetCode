//
//  1513. 仅含 1 的子串数.swift
//  LeetCode
//
//  Created by 李坤 on 2021/3/11.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func numSub(_ s: String) -> Int {
    var count = 0
    var map = [Int: Int]()
    for c in s {
        if c == "1" {
            count += 1
        } else if count != 0 {
            map[count] = (map[count] ?? 0) + 1
            count = 0
        }
    }
    if count != 0 {
        map[count] = (map[count] ?? 0) + 1
    }
    var res = 0
    for (key, value) in map {
        res += value * key * (key + 1) / 2
        if res > 1000000007 {
            res = res % 1000000007
        }
    }
    return res
}
