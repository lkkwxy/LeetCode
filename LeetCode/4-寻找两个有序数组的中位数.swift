//
//  4-寻找两个有序数组的中位数.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/16.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
// 解法1
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var i = 0
    var j = 0
    let nums1Count =  nums1.count
    let nums2Count =  nums2.count
    var nums = [Int]()
    while i < nums1Count && j < nums2Count {
        if nums1[i] < nums2[j] {
            nums.append(nums1[i])
            i += 1
        }else {
            nums.append(nums2[j])
            j += 1
        }
    }
    if i == nums1.count {
        nums.append(contentsOf: nums2[j..<nums2Count])
    }else {
       nums.append(contentsOf: nums1[i..<nums1Count])
    }
    if nums.count % 2 == 1 {
        return Double(nums[nums.count / 2])
    }else {
        return Double(nums[nums.count / 2 - 1] + nums[nums.count / 2]) / 2
    }
}

// 解法2
func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var i = 0
    var j = 0
    var index = 0
    var target:(Int,Bool) = (0,false)
    let nums1Count =  nums1.count
    let nums2Count =  nums2.count
    let numsCount = nums1Count + nums2Count
    if numsCount % 2 == 0 {
        target = (numsCount / 2 - 1,true )
    }else {
        target = (numsCount / 2, false)
    }
    while i < nums1Count && j < nums2Count {
        var isNums1 = true
        if nums1[i] < nums2[j] {
            i += 1
        }else {
            j += 1
            isNums1 = false
        }
        if index == target.0 {
            let firstValue = isNums1 ? Double(nums1[i - 1]) : Double(nums2[j - 1])
            if target.1 {
                var lastValue = 0
                if i == nums1Count {
                    lastValue = nums2[j]
                }else if j == nums2Count {
                    lastValue = nums1[i]
                }else {
                    lastValue = min(nums1[i], nums2[j])
                }
                return (firstValue + Double(lastValue)) / 2
            }else {
                return firstValue
            }
        }
        index += 1
    }
    var num:[Int]
    if i == nums1.count {
        num = nums2
        index = target.0 + j - index
    }else {
        num = nums1
        index = target.0 + i - index
    }
    if target.1 {
        return (Double(num[index]) + Double(num[index + 1])) / 2
    }else {
        return Double(num[index])
    }
}
