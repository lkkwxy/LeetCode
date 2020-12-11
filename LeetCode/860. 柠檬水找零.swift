//
//  860. 柠檬水找零.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/10.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func lemonadeChange(_ bills: [Int]) -> Bool {
    var fiveCount = 0
    var tenCount = 0
    for bill in bills {
        if bill == 5 {
            fiveCount += 1
        } else if bill == 10 {
            tenCount += 1
            fiveCount -= 1
            if fiveCount < 0 {
                return false
            }
        } else if bill == 20 {
            if tenCount > 0 {
                tenCount -= 1
                fiveCount -= 1
            } else {
                fiveCount -= 3
            }
            if fiveCount < 0 {
                return false
            }
        }
    }
    return true
}
