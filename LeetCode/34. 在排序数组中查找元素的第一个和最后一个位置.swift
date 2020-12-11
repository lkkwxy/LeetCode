//
//  34. 在排序数组中查找元素的第一个和最后一个位置.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/23.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func searchRange1(_ nums: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = nums.count - 1
    var leftResult = -1
    while left < right {
        let mid = (right - left) / 2 + left
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid
        }
    }
    if nums[left] != target {
        return [-1, -1]
    }
    leftResult = left
    right = nums.count - 1
    while left < right {
        let mid = (right - left) / 2 + left + 1
        if nums[mid] > target {
            right = mid - 1
        } else {
            left = mid
        }
    }
    return [leftResult, right]
}
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = nums.count - 1
    var mid = (right - left) / 2 + left
    var targetIndex = -1
    while left <= right {
        if nums[mid] == target {
            targetIndex = mid
            break
        } else if nums[mid] > target {
            right = mid - 1
            mid = (right - left) / 2 + left
        } else {
            left = mid + 1
            mid = (right - left) / 2 + left
        }
    }
    if targetIndex == -1 {
        return [-1, -1]
    }
    left = 0
    right = targetIndex - 1
    mid = (right - left) / 2 + left
    var leftResult = 0
    while left <= right {
        if nums[mid] < target {
            if nums[mid + 1] == target {
                leftResult = mid + 1
                break
            } else {
                left = mid + 1
                mid = (right - left) / 2 + left
            }
        } else {
            right = mid - 1
            mid = (right - left) / 2 + left
        }
    }
    left = targetIndex + 1
    right = nums.count - 1
    mid = (right - left) / 2 + left
    var rightResult = nums.count - 1
    while left <= right {
        if nums[mid] > target {
            if nums[mid - 1] == target {
                rightResult = mid - 1
                break
            } else {
                right = mid - 1
                mid = (right - left) / 2 + left
            }
        } else {
            left = mid + 1
            mid = (right - left) / 2 + left
        }
    }
    return [leftResult, rightResult]
}
