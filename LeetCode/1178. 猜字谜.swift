//
//  1178. 猜字谜.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/2/26.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findNumOfValidWords(_ words: [String], _ puzzles: [String]) -> [Int] {
    let wordsSet = words.map {
        return Set($0.utf8CString.dropLast().map { Int($0) - 97})
    }
    let puzzlesSet = puzzles.map { (item) -> (Int, Array<Int>) in
        let chars = item.utf8CString.dropLast()
        var array = Array(repeating: 0, count: 26)
        for char in chars {
            array[Int(char - 97)] += 1
        }
        return (Int(chars[0] - 97), array)
    }
    var res = [Int]()
    for puzSet in puzzlesSet {
        var count = 0
        for wordSet in wordsSet where wordSet.contains(puzSet.0) {
            var isRight = true
            for word in wordSet {
                if puzSet.1[word] == 0 {
                    isRight = false
                    break
                }
            }
            if isRight {
                count += 1
            }
        }
        res.append(count)
    }
    return res
}
