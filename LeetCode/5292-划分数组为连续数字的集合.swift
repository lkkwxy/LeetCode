//
//  5292-划分数组为连续数字的集合.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/23.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
    guard nums.count % k == 0 else { return false }
    var map = [Int:Int]()
    for num in nums {
        map[num] = (map[num] ?? 0) + 1
    }
    var sortedKeys = map.keys.sorted()
    var index = 0
    while index < sortedKeys.count {
        let key = sortedKeys[index]
        let count = map[key]!
        if count <= 0 {
            index += 1
            continue
        }
        for i in 0..<k{
            if let tmp = map[key + i] , tmp >= count {
                map[key + i] = tmp - count
            }else {
                return false
            }
        }
        index += 1
    }
    return true
}
