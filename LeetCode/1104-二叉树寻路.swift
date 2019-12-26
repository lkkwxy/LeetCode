//
//  1104-二叉树寻路.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/26.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func pathInZigZagTree(_ label: Int) -> [Int] {
    var line = 1
    while  true {
        if 1 << line >= label + 1 {
            break
        }
       line += 1
    }
    var currentLineIndex = 0
    if line % 2 == 0{
        currentLineIndex = (1 << line ) - label  - 1
    }else {
        currentLineIndex = label - (1 << (line - 1))
    }
    
    var result = [Int]()
    while line >= 1 {
        var currentLineLabel = 0
        if line % 2 == 1 {
           currentLineLabel = 1 << (line - 1) + currentLineIndex
        }else {
           currentLineLabel = 1 << line  - 1 - currentLineIndex
        }
        result.append(currentLineLabel)
        currentLineIndex = currentLineIndex / 2
        line -= 1
    }
    return result.reversed()
}
