//
//  496-下一个更大元素 I.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/27.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var stack = [Int]()
    var map = [Int:Int]()
    var result = [Int]()
    for num in nums2 {
        while !stack.isEmpty && num > stack.last!{
            map[stack.removeLast()] = num
        }
        stack.append(num)
    }
    for num in nums1 {
        if let value = map[num]  {
            result.append(value)
        }else {
            result.append(-1)
        }
    }
    return result
}
