//
//  316. 去除重复字母.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/20.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func removeDuplicateLetters(_ s: String) -> String {
    var stack = [String.Element]()
    var existSet = Set<String.Element>()
    var countMap = [String.Element: Int]()
    for code in s {
        countMap[code] = (countMap[code] ?? 0) + 1
    }

    for char in s {
        if existSet.contains(char) {
            countMap[char] = (countMap[char] ?? 0) - 1
            continue
        }
        while true {
            if stack.isEmpty || stack.last! < char || (countMap[stack.last!] ?? 1) <= 1 {
                stack.append(char)
                existSet.insert(char)
                break
            } else {
                if let last = stack.popLast() {
                    countMap[last] = (countMap[last] ?? 0) - 1
                    existSet.remove(last)
                }
            }
        }
    }
    return stack.reduce("") { (res, char) -> String in
        return res + String(char)
    }
}
