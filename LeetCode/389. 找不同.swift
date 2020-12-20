//
//  389. 找不同.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/18.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func findTheDifference(_ s: String, _ t: String) -> Character {
    var res: UInt32 = 0
    for code in s.unicodeScalars {
        res ^= code.value
    }
    
    for code in t.unicodeScalars {
        res ^= code.value
    }
    
    return Character(UnicodeScalar(res)!)
}
