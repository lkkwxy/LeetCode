//
//  224. 基本计算器.swift
//  LeetCode
//
//  Created by 李坤 on 2021/3/10.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
//"(1+(4+5+2)-3)+(6+8)"
func calculate3(_ s: String) -> Int {
    var pervString = ""
    var stack = [String]()
    for c in s {
        if c == " " || c == "+" || c == "-" || c == "(" || c == ")" {
            if !pervString.isEmpty {
                stack.append(pervString)
            }
            if c != " " {
                stack.append(String(c))
            }
            pervString = ""
        } else {
            pervString.append(c)
        }
    }
    if !pervString.isEmpty {
        stack.append(pervString)
    }
    var stack1 = [String]()
    for item in stack {
        if item != ")" {
            stack1.append(item)
        } else {
            var res = 0
            while stack1.last != "(" {
                let num = Int(stack1.removeLast())!
                let sysbol = stack1.last
                if sysbol == "+" || sysbol == "-" || sysbol == "(" {
                    if sysbol == "-" {
                        res -= num
                    } else {
                        res += num
                    }
                    if sysbol != "(" {
                        let _ = stack1.popLast()
                    }
                }
            }
            stack1[stack1.count - 1] = "\(res)"
        }
    }
    
    var res = 0
    var start = 0
    if stack1.count > 0 {
        if stack1[0] != "+" && stack1[0] != "-" {
            res = Int(stack1[0])!
            start = 1
        } else {
            res = Int(stack1[1])!
            if stack1[0] == "-" {
                res = -res
            }
            start = 2
        }
        for i in stride(from: start, to: stack1.count, by: 2) {
            if stack1[i] == "+" {
                res += Int(stack1[i + 1])!
            } else if stack1[i] == "-" {
                res -= Int(stack1[i + 1])!
            }
        }
    }
    return res
}
