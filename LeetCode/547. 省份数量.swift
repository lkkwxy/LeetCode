//
//  547. 省份数量.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/7.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findCircleNum(_ isConnected: [[Int]]) -> Int {
    var res = 0
    let n = isConnected.count
    var set = Set<Int>()
    for i in 0..<n {
        if set.contains(i) {
            continue
        }
        set.insert(i)
        res += 1
        var array = [Int]()
        for j in 0..<n {
            if isConnected[i][j] == 1 && !set.contains(j) {
                array.append(j)
            }
        }
        while !array.isEmpty {
            var tmpArray = [Int]()
            for item in array {
                for j in 0..<n {
                    if isConnected[item][j] == 1 && !set.contains(j) {
                        tmpArray.append(j)
                    }
                }
                set.insert(item)
            }
            array = tmpArray
        }
    }
    return res
}
