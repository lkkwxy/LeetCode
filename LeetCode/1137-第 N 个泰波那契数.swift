//
//  1137-第 N 个泰波那契数.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/25.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
// 解法1
var tribonacciMap = [Int:Int]()
func tribonacci(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    }else if n == 1 || n == 2{
        return 1
    }
    if let result = tribonacciMap[n] {
        return result
    }
    let result = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)
    tribonacciMap[n] = result
    return result
}

// 解法2
func tribonacci1(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    }else if n == 1 || n == 2{
        return 1
    }
    var (T1,T2,T3) = (0,1,1)
    var result = 0
    for _ in 3...n {
        result = T1 + T2 + T3
        (T1,T2,T3) = (T2,T3,result)
    }
    return result
}
