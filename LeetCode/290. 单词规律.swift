//
//  290. 单词规律.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/16.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func wordPattern(_ pattern: String, _ s: String) -> Bool {
    let ss = s.split(separator: " ")
    if ss.count != pattern.count {
        return false
    }
    var mapP = [Character: String]()
    var mapS = [String: Character]()
    for (index, value) in pattern.enumerated() {
        let tmp = String(ss[index])
        if mapP[value] == nil && mapS[tmp] == nil {
            mapP[value] = tmp
            mapS[tmp] = value
        } else if mapP[value] != tmp || mapS[tmp] != value {
            return false
        }
    }
    return true
}
