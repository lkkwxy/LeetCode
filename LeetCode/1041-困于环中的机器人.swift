//
//  1041-困于环中的机器人.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/8/3.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func isRobotBounded(_ instructions: String) -> Bool {
    var direction = 0
    var point = (0,0)
    for item in instructions {
        switch item {
        case "G":
            switch direction {
            case 0:
                point = (point.0, point.1 + 1)
            case 1:
                point = (point.0 + 1, point.1)
            case 2:
                point = (point.0, point.1 - 1)
            case 3:
                point = (point.0 - 1, point.1)
            default:
                break
            }
            break
        case "L":
            if direction == 0 {
                direction = 3
            }else {
                direction -= 1
            }
        case "R":
            if direction == 3 {
                direction = 0
            }else {
                direction += 1
            }
        default:
            break
        }
    }
    if point.0 == 0 && point.1 == 0 {
        return true
    }else if point.0 == 0 {
        return false
    }
    return true
}
