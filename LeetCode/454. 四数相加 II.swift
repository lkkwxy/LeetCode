//
//  454. 四数相加 II.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/27.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    var res = 0
    var map1 = [Int: Int]()
    A.forEach { (a) in
        B.forEach { (b) in
            map1[a + b, default: 0] += 1
        }
    }
    C.forEach { (c) in
        D.forEach { (d) in
            if let value = map1[-c - d] {
                res += value
            }
        }
    }
    return res
}
