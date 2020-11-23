//
//  452. 用最少数量的箭引爆气球.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/23.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func findMinArrowShots(_ points: [[Int]]) -> Int {
    if points.count < 2 {
        return points.count
    }
    var res = 0
    let points = points.sorted { $0[0] < $1[0] }
    var i = 0
    while i < points.count {
        res += 1
        let cur = points[i]
        var start = cur[0]
        var end = cur[1]
        var isBreak = false
        for j in i + 1..<points.count {
            if end < points[j][0] || start > points[j][1] {
                i = j
                isBreak = true
                break
            } else {
                end = min(points[j][1], end)
                start = max(points[j][0], start)
            }
        }
        if !isBreak {
            break
        }
    }
    return res
}
