//
//  1030. 距离顺序排列矩阵单元格.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/17.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
    var res = [[Int]]()
    var records = Array(repeating: Array(repeating: false, count: C), count: R)
    records[r0][c0] = true
    var currentPoint = [(r0, c0)]
    while !currentPoint.isEmpty {
        var tmp = [(Int, Int)]()
        for (r,c) in currentPoint {
            res.append([r,c])
            if r + 1 < R && records[r + 1][c] == false {
                tmp.append((r + 1, c))
                records[r + 1][c] = true
            }
            
            if r - 1 >= 0 && records[r - 1][c] == false {
                tmp.append((r - 1, c))
                records[r - 1][c] = true
            }
            
            if c + 1 < C && records[r][c + 1] == false {
                tmp.append((r, c + 1))
                records[r][c + 1] = true
            }
            
            if c - 1 >= 0 && records[r][c - 1] == false {
                tmp.append((r, c - 1))
                records[r][c - 1] = true
            }
        }
        currentPoint = tmp
    }
    return res
}
