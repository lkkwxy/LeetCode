//
//   721. 账户合并.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/22.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
    var num = K
    var digit = 0
    var ks = [Int]()
    while num != 0 {
        ks.append(num % 10)
        num = num / 10
    }
    
    var res: [Int] = A.reversed()
    if res.count < ks.count {
        (res, ks) = (ks, res)
    }
    let count = ks.count
    for i in 0..<count {
        var sum = res[i] + ks[i] + digit
        if sum > 9  {
            digit = 1
            sum -= 10
        } else {
            digit = 0
        }
        res[i] = sum
    }
    for i in count..<res.count {
        let sum = res[i] + digit
        if sum == 10 {
            res[i] = 0
            digit = 1
        } else {
            digit = 0
            res[i] = sum
            break
        }
    }
    if digit == 1 {
        res.append(1)
    }
    return res.reversed()
}
