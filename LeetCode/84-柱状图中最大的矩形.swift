//
//  84-柱状图中最大的矩形.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/26.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func largestRectangleArea(_ heights: [Int]) -> Int {
    let count = heights.count
    guard count > 0 else { return 0 }
    var stack = [(-1,-1),(0,heights[0])]
    var maxArea = 0
    for i in 1..<count {
        if heights[i] >= heights[i - 1] {
            stack.append((i, heights[i]))
        }else {
            while stack.count > 0 {
                let (_,lastHeight) = stack.last!
                if lastHeight > heights[i] {
                    maxArea = max(maxArea, (i -  stack[stack.count - 2].0 - 1) * lastHeight)
                    let _ = stack.popLast()
                }else {
                    stack.append((i, heights[i]))
                    break
                }
            }
            
        }
    }
    while stack.count > 1 {
        let (_,lastHeight) = stack.last!
        if stack.count == 2 {
            maxArea = max(maxArea, count * lastHeight)
        }else {
            maxArea = max(maxArea, (count -  stack[stack.count - 2].0 - 1) * lastHeight)
        }
        let _ = stack.popLast()
    }
    return maxArea
}
