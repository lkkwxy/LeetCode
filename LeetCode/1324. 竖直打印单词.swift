//
//  1324. 竖直打印单词.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/20.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func printVertically(_ s: String) -> [String] {
    var maxCount = -1
    let chars = s.components(separatedBy: " ").map { (item) -> (String, Int) in
        let count = item.count
        maxCount = max(maxCount, count)
        return (item, count)
    }
    var res = [String]()
    for i in 0..<maxCount {
        var j = 0
        var word = ""
        for (s, count) in chars {
            if i >= count {
                j += 1
            } else {
                word = word + Array(repeating: " ", count: j).joined() + String(s[s.index(s.startIndex, offsetBy: i)])
                j = 0
            }
        }
        res.append(word)
    }
    return res
}
