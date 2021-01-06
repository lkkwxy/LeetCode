//
//  399. 除法求值.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/6.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
    var map = [String: [String: Double]]()
    for (index, value) in equations.enumerated() {
        let item1 = value[0]
        let item2 = value[1]
        var insert = false
        for (key, value) in map {
            var tmpValue = value
            if key == item1 {
                insert = true
                tmpValue[item2] = values[index]
            } else if key == item2 {
                insert = true
                tmpValue[item1] = 1 / values[index]
            } else if value.keys.contains(item1) {
                insert = true
                tmpValue[item2] = value[item1]! * values[index]
            } else if value.keys.contains(item2) {
                insert = true
                tmpValue[item1] = value[item2]! / values[index]
            }
            if insert {
                map[key] = tmpValue
                break
            }
        }
        if !insert {
            map[item1] = [item2: values[index]]
        }
    }
    var array = [[String: Double]]()
    for (index, value) in map {
        var map = value
        map[index] = 1
        array.append(map)
    }
    var i = 0
    while i < array.count && array.count > 1 {
        var tmpArray = array
        var first = array[i]
        for j in stride(from: array.count - 1, to: i, by: -1) {
            let cur = array[j]
            var key: String? = nil
            for item in cur.keys {
                if first.keys.contains(item) {
                    key = item
                    tmpArray.remove(at: j)
                    break
                }
            }
            if let key = key {
                let scale = first[key]! / cur[key]!
                for (item, value) in cur {
                    first[item] = scale * value
                }
            }
        }
        tmpArray[i] = first
        array = tmpArray
        i += 1
    }
    var res = [Double]()
    for (_, value) in queries.enumerated() {
        let item1 = value[0]
        let item2 = value[1]
        var isAppend = false
        for item in array {
            if let v1 = item[item1] , let v2 = item[item2] {
                isAppend = true
                res.append(v2 / v1)
                break
            }
        }
        if !isAppend {
            res.append(-1)
        }
    }
    return res
}
