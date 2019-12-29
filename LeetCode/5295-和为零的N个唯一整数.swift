//
//  5295-和为零的N个唯一整数.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/29.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func sumZero(_ n: Int) -> [Int] {
    guard n > 1 else { return [0] }
    var result = Array(repeating: 0, count: n)
    for i in 1...n/2 {
        result[i - 1] = i
        result[n - i] = -i
    }
    return result
}
