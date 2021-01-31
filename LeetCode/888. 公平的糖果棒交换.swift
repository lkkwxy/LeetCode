//
//  888. 公平的糖果棒交换.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/1.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
    let sumA = A.reduce(0) { $0 + $1 }
    let sumB = B.reduce(0) { $0 + $1 }
    let diff = (sumA - sumB) / 2
    let setB = Set(B)
    var res = [Int]()
    for a in A {
        let b = a - diff
        if setB.contains(b) {
            res = [a, b]
            break
        }
    }
    return res
}
