//
//  1370. 上升下降字符串.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/25.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation

func sortString1(_ s: String) -> String {
    var codes = Array(repeating: 0, count: 26)
    for code in s.unicodeScalars {
        codes[Int(code.value) - 97] = codes[Int(code.value) - 97] + 1
    }
    var charCounts = [(String, Int)]()
    for i in 0...25 {
        if codes[i] > 0 {
            charCounts.append((String(UnicodeScalar(i + 97)!), codes[i]))
        }
    }
    var res = ""
    var isUpSort = true
    
    while !charCounts.isEmpty {
        var range: StrideTo<Int>
        if isUpSort {
            range = stride(from: 0, to: charCounts.count, by: 1)
        } else {
            range = stride(from: charCounts.count - 1, to: -1, by: -1)
        }
        for i in range {
            let (char, count) = charCounts[i]
            charCounts[i] = (char, count - 1)
            res += char
        }
         isUpSort.toggle()
        charCounts = charCounts.filter({ (arg1) -> Bool in
            return arg1.1 > 0
        })
    }
    return res
}
