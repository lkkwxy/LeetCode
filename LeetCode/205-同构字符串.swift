//
//  205-同构字符串.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/15.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var sMap = [CChar:CChar]()
    var tMap = [CChar:CChar]()
    let sArray = s.utf8CString
    let tArray = t.utf8CString
    for i in 0..<sArray.count {
        if let value = sMap[sArray[i]] {
            if value != tArray[i] {
                return false
            }
        }else {
            sMap[sArray[i]] = tArray[i]
        }
         if let value = tMap[tArray[i]] {
            if value != sArray[i] {
                return false
            }
        }else {
            tMap[tArray[i]] = sArray[i]
        }
    }
    return true
}
