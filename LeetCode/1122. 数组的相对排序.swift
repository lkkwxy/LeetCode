//
//  1122. 数组的相对排序.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/14.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var result = [Int]()
    var bucketList = Array(repeating: 0, count: 1001)
    for item in arr1 {
        bucketList[item] += 1
    }
    for item in arr2 {
        if bucketList[item] > 0 {
            result.append(contentsOf: Array(repeating: item, count: bucketList[item]))
            bucketList[item] = 0
        }
    }
    for i in 0...1000 {
        if bucketList[i] > 0 {
            result.append(contentsOf: Array(repeating: i, count: bucketList[i]))
        }
    }
    return result
}

func relativeSortArray1(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var map = [Int: Int]()
    var result = [Int]()
    for (index, value) in arr2.enumerated() {
        map[value] = index
    }
    result = arr1.sorted { (item1, item2) -> Bool in
        let index1 = map[item1]
        let index2 = map[item2]
        if let index1 = index1, let index2 = index2 {
            return index1 < index2
        } else if let _ = index1 {
            return true
        } else if let _ = index2 {
            return false
        }
        return item1 <= item2
    }
    return result
}
