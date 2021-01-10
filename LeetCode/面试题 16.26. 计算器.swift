//
//  面试题 16.26. 计算器.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/4.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
/// 解法1
func calculate(_ s: String) -> Int {
    var stack = Array<String>()
    var pervString = ""
    var pervType = ""
    for c in s {
        if c == "+" || c == "-" || c == "*" || c == "/" {
            if pervType == "*" || pervType == "/" {
                let num1 = Int(stack[stack.count - 2])!
                let num2 = Int(pervString)!
                let res = pervType == "*" ? num1 * num2 : num1 / num2
                let _ = stack.popLast()
                stack[stack.count - 1] = "\(res)"
            } else {
                stack.append(pervString)
            }
            pervString = ""
            stack.append(String(c))
            pervType = String(c)
        } else if c != " " {
            pervString += String(c)
        }
    }
    if pervString != "" {
        if let last = stack.last , (last == "*" || last == "/") {
            let num1 = Int(stack[stack.count - 2])!
            let num2 = Int(pervString)!
            let res = last == "*" ? num1 * num2 : num1 / num2
            let _ = stack.popLast()
            stack[stack.count - 1] = "\(res)"
        } else {
            stack.append(pervString)
        }
    }
    var res = Int(stack[0])!
    for i in stride(from: 1, to: stack.count - 1, by: 2) {
        if stack[i] == "+" {
            res +=  Int(stack[i + 1])!
        } else if stack[i] == "-" {
            res -= Int(stack[i + 1])!
        }
    }
    return res
}


/// 解法1
func calculate2(_ s: String) -> Int {
    var stack = Array<String>()
    var pervString = ""
    for c in s {
        if c == "+" || c == "-" || c == "*" || c == "/" {
            if pervString != "" {
                stack.append(pervString)
                pervString = ""
            }
            stack.append(String(c))
        } else if c != " " {
            pervString += String(c)
        }
    }
    if pervString != "" {
        stack.append(pervString)
    }
    var i = 0
    while i < stack.count {
        if stack[i] == "*" || stack[i] == "/" {
            let num1 = Int(stack[i - 1])!
            let num2 = Int(stack[i + 1])!
            let res = stack[i] == "*" ? num1 * num2 : num1 / num2
            stack.replaceSubrange(i - 1...i + 1, with: ["\(res)"])
            i -= 1
        }
        i += 1
    }
    var res = Int(stack[0])!
    for i in stride(from: 1, to: stack.count - 1, by: 2) {
        if stack[i] == "+" {
            res +=  Int(stack[i + 1])!
        } else if stack[i] == "-" {
            res -= Int(stack[i + 1])!
        }
    }
    return res
}
