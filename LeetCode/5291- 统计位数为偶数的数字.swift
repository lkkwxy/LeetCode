//
//  5291- 统计位数为偶数的数字.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/23.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func findNumbers(_ nums: [Int]) -> Int {
    var count = 0
    for num in nums {
        var digitCount = num == 0 ? 1 : 0
        var currentNum = num
        while currentNum != 0 {
            currentNum /= 10
            digitCount += 1
        }
        if digitCount % 2 == 0 {
            count += 1
        }
    }
    return count
}

func findNumbers1(_ nums: [Int]) -> Int {
    var count = 0
    for num in nums {
        if (num > 9 && num < 100) || (num > 999 && num < 10000){
            count += 1
        }
    }
    return count
}
