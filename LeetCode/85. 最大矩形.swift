//
//  85. 最大矩形.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/27.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func maximalRectangle(_ matrix: [[Character]]) -> Int {
    let m = matrix.count
    guard m > 0 else {
        return 0
    }
    guard let n = matrix.first?.count, n > 0 else {
        return 0
    }
    var res = 0
    var heights = Array(repeating: 0, count: n)
    for i in 0..<m {
        for j in stride(from: n - 1, to: -1, by: -1) {
            if matrix[i][j] == "1" {
                heights[j] += 1
            } else {
                heights[j] = 0
            }
        }
        var stack = [(-1, -1),(0, heights[0])]
        for i in 1..<heights.count {
            if heights[i] >= heights[i - 1] {
                stack.append((i, heights[i]))
            } else {
                while stack.count > 0 {
                    let (_, lastHeight) = stack.last!
                    if lastHeight > heights[i] {
                        res = max(res, lastHeight * (i - stack[stack.count - 2].0 - 1))
                        let _ = stack.popLast()
                    } else {
                        stack.append((i, heights[i]))
                        break
                    }
                }
            }
        }
        while stack.count > 1 {
            let (_, lastHeight) = stack.last!
            res = max(res, lastHeight * (heights.count - stack[stack.count - 2].0 - 1))
            let _ = stack.popLast()
        }
    }
    return res
}
