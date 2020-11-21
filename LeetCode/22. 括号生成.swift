//
//  22. 括号生成.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/21.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func generateParenthesis(_ n: Int) -> [String] {
    if n == 0 { return [] }
    if n == 1 { return ["()"] }
    if n == 2 { return ["()()", "(())"] }
    
    var res = [Set<String>(), Set<String>(["()"]), Set<String>(["()()", "(())"])]
    for i in 3...n {
        var tmp = Set<String>()
        for j in 1..<i {
            for l in res[j] {
                for r in res[i - j] {
                    tmp.insert(l + r)
                }
            }
        }
        for item in res[i - 1] {
            tmp.insert("(\(item))")
        }
        res.append(tmp)
    }
    return Array(res.last!)
}

