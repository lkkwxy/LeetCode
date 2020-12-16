//
//  649. Dota2 参议院.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/11.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func predictPartyVictory(_ senate: String) -> String {
    var rCount = 0
    var array = senate.map { $0 == "R" }
    while !(rCount >= array.count || rCount * -1 >= array.count) {
        var tmp = [Bool]()
        for item in array {
            if rCount == 0 {
                rCount = item ? 1 : -1
                tmp.append(item)
            } else if rCount > 0 {
                if item {
                    rCount += 1
                    tmp.append(item)
                } else {
                    rCount -= 1
                }
            } else {
                if item {
                    rCount += 1
                } else {
                    rCount -= 1
                    tmp.append(item)
                }
            }
        }
        array = tmp
    }
    return array[0] ? "Radiant" : "Dire"
}
