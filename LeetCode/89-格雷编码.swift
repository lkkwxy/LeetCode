//
//  89-格雷编码.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/11.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func grayCode(_ n: Int) -> [Int] {
    var codes = [0]
    if n == 0 {
        return [0]
    }
    for i in 1...n {
        for code in codes.reversed() {
            codes.append((1 << (i - 1)) | code)
        }
    }
    return codes
}
