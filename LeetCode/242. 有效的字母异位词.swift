//
//  242. 有效的字母异位词.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/22.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }
    var map = [String.Element : Int]()
    for c in s {
        map[c] = (map[c] ?? 0 ) + 1
    }
    for c in t {
        if let count = map[c], count > 0 {
            if count == 1 {
                map.removeValue(forKey: c)
            } else {
                map[c] = count - 1
            }
        } else {
            return false
        }
    }
    return map.keys.count == 0
}
