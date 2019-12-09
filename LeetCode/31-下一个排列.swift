//
//  31. 下一个排列.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/9.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func nextPermutation(_ nums: inout [Int]) {
    for i in stride(from: nums.count - 1, to: 0, by: -1) {
        if nums[i] > nums[i - 1] {
            var minThanNum = nums[i]
            var minThanIndex = i
            for k in (i+1)..<nums.count {
                if minThanNum >= nums[k] && nums[k] > nums[i - 1] {
                    minThanNum = nums[k]
                    minThanIndex = k
                }
            }
            let tmp = nums[i - 1]
            nums[i - 1] = nums[minThanIndex]
            nums[minThanIndex] = tmp
            let count = nums.count - i
            let start = i
            for j in stride(from: start, to: start + count / 2, by: 1) {
                let tmp = nums[j]
                nums[j] = nums[count + start + start - j - 1]
                nums[count + start +  start - j - 1] = tmp
            }
            return
        }
    }
    nums.reverse()
}

