//
//  832. 翻转图像.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/24.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var res = A
    for i in 0..<res.count {
        var lines = res[i]
        var l = 0
        var r = lines.count - 1
        while l <= r {
            if lines[l] == lines[r] {
                lines[l] = lines[l] == 0 ? 1 : 0
                lines[r] = lines[l]
            }
            l += 1
            r -= 1
        }
        res[i] = lines
    }
    return res
}
