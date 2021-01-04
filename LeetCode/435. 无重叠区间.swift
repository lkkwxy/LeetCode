//
//  435. 无重叠区间.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/31.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    guard intervals.count > 1 else {
        return 0
    }
    var res = 0
    let intervals = intervals.sorted { (item1, item2) -> Bool in
        return item1[1] < item2[1]
    }
    var right = intervals[0][1]
    for i in 1..<intervals.count {
        if intervals[i][0] < right {
            res += 1
        } else {
            right = intervals[i][1]
        }
    }
    return res
}
