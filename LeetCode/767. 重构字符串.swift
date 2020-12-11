//
//  767. 重构字符串.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/30.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func reorganizeString(_ S: String) -> String {
    let count = S.count
    if count <= 1 {
        return S
    }
    var array = Array(repeating: 0, count: 26)
    for item in S.unicodeScalars {
        array[Int(item.value) - 97] += 1
    }
    let sortArray = array.enumerated().map { (arg) -> (Int, Int) in
        return (arg.offset, arg.element)
    }.filter { (arg) -> Bool in
        return arg.1 > 0
    }.sorted { (arg1, arg2) -> Bool in
        return arg1.1 > arg2.1
    }
    if !sortArray.isEmpty && sortArray[0].1 <= (count + 1) / 2 {
        var resArray = Array(repeating: "", count: count)
        var index = 0
        for (char, charCount) in sortArray {
            let ele = String(UnicodeScalar(char + 97)!)
            for _ in 0..<charCount {
                resArray[index % count] = ele
                index += 2
                if index >= count {
                    index = 1
                }
            }
        }
        return resArray.joined()
    }
    return ""
}
