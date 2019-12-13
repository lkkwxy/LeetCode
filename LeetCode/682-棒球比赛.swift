//
//  682-棒球比赛.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/13.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func calPoints(_ ops: [String]) -> Int {
    var score = 0
    var opScores = [Int]()
    for op in ops {
        var tmp = 0
        if op == "+" {
            if opScores.count > 1 {
                tmp = opScores[opScores.count - 1] + opScores[opScores.count - 2]
                opScores.append(tmp)
            }
        }else if op == "D" {
            tmp = (opScores.last ?? 0) * 2
            opScores.append(tmp)
        }else if op == "C" {
            tmp = -(opScores.popLast() ?? 0)
        }else {
            tmp = Int(op) ?? 0
            opScores.append(tmp)
        }
        score += tmp
    }
    return score
}
