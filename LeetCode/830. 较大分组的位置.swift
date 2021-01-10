//
//  830. 较大分组的位置.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/5.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func largeGroupPositions(_ s: String) -> [[Int]] {
    var pervChar: String.Element = " "
    let lastIndex = s.count - 1
    var pervIndex = 0
    var res = [[Int]]()
    for (index, value) in s.enumerated() {
        if value != pervChar {
            if index - pervIndex >= 3 {
                res.append([pervIndex, index - 1])
            }
            pervIndex = index
        } else if lastIndex == index {
            if index - pervIndex >= 2 {
                res.append([pervIndex, index])
            }
        }
        pervChar = value
    }
    
    return res
}
