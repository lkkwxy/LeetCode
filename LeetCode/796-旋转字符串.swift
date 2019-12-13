//
//  796-旋转字符串.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/13.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func rotateString(_ A: String, _ B: String) -> Bool {
    guard A.count == B.count else { return false }
    guard A != B else { return true }
    return (A + A).contains(B)
}
