//
//  1232. 缀点成线.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/17.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
    let delatX = coordinates[0][0]
    let delatY = coordinates[0][1]
    let a = coordinates[1][1] - delatY
    let b = delatX - coordinates[1][0]
    for i in 2..<coordinates.count {
        let x = coordinates[i][0] - delatX
        let y = coordinates[i][1] - delatY
        if a * x + b * y != 0 {
            return false
        }
    }
    return true
}
