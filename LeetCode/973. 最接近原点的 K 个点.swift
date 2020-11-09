//
//  973. 最接近原点的 K 个点.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/9.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
    var map = [Int: [[Int]]]()
    for point in points {
        let distance = point[0] * point[0] + point[1] * point[1]
        if var tmp = map[distance] {
            tmp.append(point)
            map[distance] = tmp
        } else {
            map[distance] = [point]
        }
        
    }
    let sortKeys = map.keys.sorted()
    var result = [[Int]]()
    for key in sortKeys where result.count < K {
        result.append(contentsOf: map[key]!)
    }
    return result
}
