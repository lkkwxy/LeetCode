//
//  main.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/9.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation

func squareNumberCount(_ nums:[Int]) -> Int {
    var count = 0
    var left = 0
    var right = nums.count - 1
    while left <= right {
        let tmpLeft = nums[left]
        let tmpRight = nums[right]
        var isAddLeft = false
        var isSubtractRight = false
        if abs(tmpLeft) == abs(tmpRight) {
            isAddLeft = true
            isSubtractRight = true
        }else if abs(tmpLeft) < abs(tmpRight) {
            isSubtractRight = true
        }else {
            isAddLeft = true
        }
        if isAddLeft {
            left += 1
            while tmpLeft == nums[left] && left < right {
                left += 1
            }
        }
        
        if isSubtractRight {
            right -= 1
            while tmpRight == nums[right] && left < right {
                right -= 1
            }
        }
        count += 1
    }
    return count
}
minimumEffortPath([[4,3,4,10,5,5,9,2],[10,8,2,10,9,7,5,6],[5,8,10,10,10,7,4,2],[5,1,3,1,1,3,1,9],[6,4,10,6,10,9,4,6]])
