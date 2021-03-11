//
//  1047. 删除字符串中的所有相邻重复项.swift
//  LeetCode
//
//  Created by 李坤 on 2021/3/9.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func removeDuplicates(_ S: String) -> String {
    var res: [String.Element] = []
    for c in S  {
        if res.last == c {
            res.removeLast()
        } else {
            res.append(c)
        }
        
    }
    return String(res)
}
