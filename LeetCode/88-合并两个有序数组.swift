//
//  88-合并两个有序数组.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/27.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    for i in stride(from: n + m - 1, to: n - 1, by: -1) {
        nums1[i] = nums1[i - n]
    }
    
    var i = 0, j = 0
    while i < m && j < n {
        if nums1[n + i] > nums2[j] {
            nums1[i + j] = nums2[j]
            j += 1
        }else {
            nums1[i + j] = nums1[n + i]
            i += 1
        }
    }
    while i < m {
        nums1[i + j] = nums1[n + i]
        i += 1
    }
    
    while j < n {
        nums1[i + j] = nums2[j]
        j += 1
    }
}
