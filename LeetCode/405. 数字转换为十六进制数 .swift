//
//  405. 数字转换为十六进制数 .swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/15.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func toHex(_ num: Int) -> String {
    if num == 0 {
        return "0"
    }
    let array = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
    var bits = Array(repeating: 0, count: 32)
    var num = num
    for i in 0...31 {
        if num & 1 == 1 {
            bits[31 - i] = 1
        }
        num >>= 1
    }
    var result = ""
    var leadingZero = true
    for i in stride(from: 0, to: 32, by: 4) {
        let number = bits[i] * 8 + bits[i + 1] * 4 + bits[i + 2] * 2 + bits[i + 3]
        if number == 0 && leadingZero {
            continue
        }
        leadingZero = false
        result += array[number]
    }
    return result
}
