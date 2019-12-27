//
//  42-接雨水.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/27.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func trap(_ height: [Int]) -> Int {
    guard height.count > 2 else { return 0 }
    var ans = 0
    var right = height.count - 1, left = 0
    var leftMax = 0, rightMax = 0
    while left < right {
        if height[left] < height[right]{
            if height[left] > leftMax {
                leftMax = height[left]
            }else {
                ans += (leftMax - height[left])
            }
            left += 1
        }else {
            if height[right] > rightMax {
                rightMax = height[right]
            }else {
                ans += (rightMax - height[right])
            }
            right -= 1
        }
    }
    return ans
}



func trap1(_ height: [Int]) -> Int {
    guard height.count > 2 else { return 0 }
    var ans = 0
    var stack = [Int]()
    for (index,curHeight) in height.enumerated() {
        while stack.count > 0 && curHeight > height[stack.last!]{
            let topIndex = stack.removeLast()
            if stack.count == 0 {
                break
            }
            let distance = index - stack.last! - 1
            ans += (min(curHeight, height[stack.last!]) - height[topIndex]) * distance
        }
        stack.append(index)
    }
    return ans
}
