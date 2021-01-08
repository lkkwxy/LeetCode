//
//  29. 两数相除.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/8.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend < 0 && divisor < 0 {
            if divisor <= dividend {
                return divisor == dividend ? 1 : 0
            }
            if dividend == Int32.min {
                if divisor == -1 {
                    return Int(Int32.max)
                }
                return 1 + divide(divisor - dividend, -divisor)
            }
            return divide(-dividend, -divisor)
        } else if divisor < 0 {
            if divisor == Int.min {
                return 0
            }
            return 0 - divide(dividend, -divisor)
        } else if dividend < 0 {
            if dividend == Int32.min {
                return -1 - divide(-divisor - dividend, divisor)
            }
            return 0 - divide(-dividend, divisor)
        }
        return div(dividend, divisor)
    }

    func div(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend < divisor {
            return 0
        }
        if divisor == 1 {
            return dividend
        }
        var res = 1
        var curDivisor = divisor
        while dividend >= curDivisor + curDivisor {
            res = res + res
            curDivisor = curDivisor + curDivisor
        }
        return res + div(dividend - curDivisor, divisor)
    }
