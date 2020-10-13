//
//  1002. 查找常用字符.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/10/14.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func commonChars(_ A: [String]) -> [String] {
    var map = [String.Element: Int]()
    for item in A {
        var tmpMap = [String.Element: Int]()
        for char in item {
            tmpMap[char] = (tmpMap[char] ?? 0) + 1
        }
        if map.count == 0 {
            map = tmpMap
        } else {
            for (key, value) in map {
                map[key] = min(value, tmpMap[key] ?? 0)
            }
        }
    }
    var result = [String]()
    for (key, value) in map where value > 0 {
        let char = String(key)
        for _ in 0..<value {
            result.append(char)
        }
    }
    return result
}
