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


print(maxNumber([2,5,6,4,4,0], [7,3,8,0,6,5,7,6,2], 15))

//print(maxNumber([3,4,6,5], [9,1,2,5,8,3], 5))

//[3,4,6,5]
//[9,1,2,5,8,3]
//5

