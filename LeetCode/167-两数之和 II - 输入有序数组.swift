//
//  167-两数之和 II - 输入有序数组.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/28.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var i = 0, j = numbers.count - 1
    while i < j {
        let sum = numbers[i] + numbers[j]
        if sum == target {
            return [i + 1, j + 1]
        }else if sum > target {
            j -= 1
        }else {
            i += 1
        }
    }
    return []
}
