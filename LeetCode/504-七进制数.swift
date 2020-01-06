//
//  504-七进制数.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/1/6.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func convertToBase7(_ num: Int) -> String {
    guard num != 0 else { return "0" }
    var ans = "", prefix = ""
    var num = num
    if num < 0 { prefix = "-"; num = -num }
    
    while num != 0 {
        ans = "\(num % 7)" + ans
        num = num / 7
    }
    return prefix + ans
}
