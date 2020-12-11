//
//  118. 杨辉三角.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/6.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func generate(_ numRows: Int) -> [[Int]] {
    if numRows == 1 {
        return [[1]]
    }
    if numRows == 2 {
        return [[1], [1,1]]
    }
    var res = [[1], [1,1]]
    for i in 3...numRows {
        var tmp = Array(repeating: 1, count: i)
        let last = res.last!
        for j in 1..<i - 1 {
            tmp[j] = last[j] + last[j - 1]
        }
        res.append(tmp)
    }
    return res
}


