//
//  321. 拼接最大数.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/2.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
/**
 给定长度分别为 m 和 n 的两个数组，其元素由 0-9 构成，表示两个自然数各位上的数字。现在从这两个数组中选出 k (k <= m + n) 个数字拼接成一个新的数，要求从同一个数组中取出的数字保持其在原数组中的相对顺序。

 求满足该条件的最大数。结果返回一个表示该最大数的长度为 k 的数组。

 说明: 请尽可能地优化你算法的时间和空间复杂度。

 示例 1:

 输入:
 nums1 = [3, 4, 6, 5]
 nums2 = [9, 1, 2, 5, 8, 3]
 k = 5
 输出:
 [9, 8, 6, 5, 3]
 示例 2:

 输入:
 nums1 = [6, 7]
 nums2 = [6, 0, 4]
 k = 5
 输出:
 [6, 7, 6, 0, 4]
 示例 3:

 输入:
 nums1 = [3, 9]
 nums2 = [8, 9]
 k = 3
 输出:
 [9, 8, 9]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/create-maximum-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
/**
 [2,5,6,4,4,0]
 [7,3,8,0,6,5,7,6,2]
 15
 [7,3,8,2,5,6,4,4,0,0,6,5,7,6,2]
 [7,3,8,2,5,6,4,4,0,6,5,7,6,2,0]
 */
func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
    let start = max(0, k - nums2.count)
    let end = min(k, nums1.count)
    var res = [Int]()
    for i in start...end {
        let stack1 = maxStack(nums: nums1, k: i)
        let stack2 = maxStack(nums: nums2, k: k - i)
        res = compareIntArray(item1: res, item2: mergetStack(stack1: stack1, stack2: stack2))
    }
    return res
}

func compareIntArray(item1: [Int], item2: [Int]) -> [Int] {
    var i = 0
    var j = 0
    while i < item1.count && j < item2.count {
        if item1[i] < item2[j] {
            return item2
        } else if item1[i] > item2[j] {
            return item1
        }
        i += 1
        j += 1
    }
    if i == item1.count {
        return item2
    }
    return item1
}

func mergetStack(stack1: [Int], stack2: [Int]) -> [Int] {
    var res = [Int]()
    var i = 0
    var j = 0
    let compare = {(index1: Int, index2: Int) -> Bool in
        var index1 = index1
        var index2 = index2
        while index1 < stack1.count && index2 < stack2.count {
            if stack1[index1] < stack2[index2] {
                return false
            } else if stack1[index1] > stack2[index2] {
                return true
            }
            index1 += 1
            index2 += 1
        }
        return index1 != stack1.count
    }
    while i < stack1.count && j < stack2.count {
        if compare(i, j) {
            res.append(stack1[i])
            i += 1
        } else {
            res.append(stack2[j])
            j += 1
        }
    }

    while i < stack1.count {
        res.append(stack1[i])
        i += 1
    }
    
    while j < stack2.count {
        res.append(stack2[j])
        j += 1
    }
    return res
}

func maxStack(nums: [Int], k: Int) -> [Int] {
    var res = Array(repeating: 0, count: k)
    var top = -1
    var remain = nums.count - k
    for i in 0..<nums.count {
        while top >= 0 && res[top] < nums[i] && remain > 0 {
            top -= 1
            remain -= 1
        }
        if top < k - 1 {
            top += 1
            res[top] = nums[i]
        } else {
            remain -= 1
        }
    }
    return res
}
