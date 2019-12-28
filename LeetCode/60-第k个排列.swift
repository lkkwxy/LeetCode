//
//  60-第k个排列.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/28.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func getPermutation(_ n: Int, _ k: Int) -> String {
    let factorial = { (n: Int) -> Int in
        guard n > 1 else { return 1 }
        var res = 1
        for i in 2...n {
            res *= i
        }
        return res
    }
    var result = ""
    var k = k
    var array = Array(1...n)
    while array.count > 0 {
        if array.count == 1 { result += "\(array[0])"; break}
        let count = factorial(array.count - 1)
        let index = k / count + (k % count == 0 ? -1 : 0)
        result += "\(array.remove(at: index))"
        k -= count * index
    }
    return result
}
