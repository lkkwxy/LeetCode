//
//  646. 最长数对链.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/4.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findLongestChain(_ pairs: [[Int]]) -> Int {
    guard pairs.count > 1 else {
        return pairs.count
    }
    let sortPairs = pairs.sorted { (item1, item2) -> Bool in
        if item1[1] <= item2[1] {
            if item1 == item2 {
                return item1[0] <= item2[0]
            }
            return true
        }
        return false
    }
    var count = 1
    var right = sortPairs[0][1]
    for i in 1..<sortPairs.count {
        if sortPairs[i][0] > right {
            count += 1
            right = sortPairs[i][1]
        }
    }
    return count
}
