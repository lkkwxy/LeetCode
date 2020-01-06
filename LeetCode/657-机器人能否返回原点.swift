//
//  657-机器人能否返回原点.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/1/6.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func judgeCircle(_ moves: String) -> Bool {
    guard moves.count % 2 == 0 else { return false }
    var L = 0, D = 0
    for m in moves {
        if m == "L" {
            L += 1
        }else if m == "R" {
            L -= 1
        }else if m == "D" {
            D += 1
        }else if m == "U" {
            D -= 1
        }
    }
    return L == 0 && D == 0
}
