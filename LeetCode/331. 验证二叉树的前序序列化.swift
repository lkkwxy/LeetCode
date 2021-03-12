//
//  331. 验证二叉树的前序序列化.swift
//  LeetCode
//
//  Created by 李坤 on 2021/3/12.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func isValidSerialization(_ preorder: String) -> Bool {
    var stack = [Int]()
    var pervIsNumber = false
    for item in preorder {
        if stack.isEmpty {
            return false
        }
        if item != "," {
            if item == "#" {
                stack[stack.count] -= 1
                pervIsNumber = false
            } else {
                pervIsNumber = true
            }
        } else if pervIsNumber {
            stack[stack.count] -= 1
            if stack.last == 0 {
                let _ = stack.popLast()
            }
            stack.append(2)
        }
    }
    return stack.isEmpty
}
