//
//  1614. 括号的最大嵌套深度.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/4.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func maxDepth(_ s: String) -> Int {
    var depth = 0
    var maxDepth = 0
    for char in s {
        if char == "(" {
            depth += 1
            maxDepth = max(depth, maxDepth)
        } else if char == ")" {
            depth -= 1
        }
    }
    return maxDepth
}
