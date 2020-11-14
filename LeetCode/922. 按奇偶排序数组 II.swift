//
//  922. 按奇偶排序数组 II.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/12.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func sortArrayByParityII(_ A: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: A.count)
    var i = 0
    var j = 1
    for value in A {
        if value & 1 == 0 {
            result[i] = value
            i += 2
        } else {
            result[j] = value
            j += 2
        }
    }
    return result
}



func sortArrayByParityII1(_ A: [Int]) -> [Int] {
    var result = A
    var i = 0
    var j = 0
    var oddIndexs = Array(repeating: -1, count: A.count / 2)
    var evenIndexs = Array(repeating: -1, count: A.count / 2)
    for (index, value) in A.enumerated() {
        if index & 1 == 1 {
            if value & 1 == 0 {
                oddIndexs[i] = index
                i += 1
            }
        } else {
            if value & 1 == 1 {
                evenIndexs[j] = index
                j += 1
            }
        }
    }
    for i in 0..<i {
        (result[oddIndexs[i]], result[evenIndexs[i]]) = (result[evenIndexs[i]], result[oddIndexs[i]])
    }
    return result
}
