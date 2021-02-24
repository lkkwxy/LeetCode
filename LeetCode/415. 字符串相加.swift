//
//  415. 字符串相加.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/21.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func addStrings(_ num1: String, _ num2: String) -> String {
    var res = ""
    var num1CharArray = num1.utf8CString.dropLast()
    var num2CharArray = num2.utf8CString.dropLast()
    if num2CharArray.count > num1CharArray.count {
        (num1CharArray, num2CharArray) = (num2CharArray, num1CharArray)
    }
    var isDigit: Int8 = 0
    let num1Count = num1CharArray.count
    let num2Count = num2CharArray.count
    for i in 0..<num2Count {
        var sum = num1CharArray[num1Count - 1 - i] + num2CharArray[num2Count - 1 - i] + isDigit - 96
        if sum > 9 {
            sum -= 10
            isDigit = 1
        } else {
            isDigit = 0
        }
        res = "\(sum)\(res)"
    }
    for i in num2Count..<num1Count {
        var sum = num1CharArray[num1Count - 1 - i] + isDigit - 48
        if sum > 9 {
            sum -= 10
            isDigit = 1
        } else {
            isDigit = 0
        }
        res = "\(sum)\(res)"
    }
    return res
}
