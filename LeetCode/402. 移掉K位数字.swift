//
//  402. 移掉K位数字.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/15.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func removeKdigits1(_ num: String, _ k: Int) -> String {
    guard k != 0 else {
        return num
    }
    guard k < num.count else {
        return "0"
    }
    var k = k
    var stack = [String.Element]()
    for item in num {
        while stack.count > 0 && k > 0 && stack.last! > item {
            stack.removeLast()
            k -= 1
        }
        stack.append(item)
    }
    while k > 0 {
        stack.removeLast()
        k -= 1
    }
    var res = ""
    var leadingZero = true
    for item in stack {
        if item == "0" && leadingZero {
            continue
        }
        leadingZero = false
        res.append(item)
    }
    if res.isEmpty {
        res = "0"
    }
    return res
}
func removeKdigits(_ num: String, _ k: Int) -> String {
    return removeKdigits(num as NSString, k) as String
}

func removeKdigits(_ num: NSString, _ k: Int) -> NSString {
    if k == 0 {
        return num
    }
    if k >= num.length {
        return "0"
    }
    let nextNumber = num.substring(with: NSRange(location: 1, length: 1))
    if nextNumber == "0" {
        for i in 2..<num.length {
            if num.substring(with: NSRange(location: i, length: 1)) != "0" {
                let tmp = num.substring(from: i) as NSString
                return removeKdigits(tmp, k - 1)
            }
        }
    } else {
        for i in 0...num.length - 1 {
            let cur = num.substring(with: NSRange(location: i, length: 1))
            let next = num.substring(with: NSRange(location: i + 1, length: 1))
            if cur > next {
                let tmp = num.replacingCharacters(in: NSRange(location: i, length: 1), with: "") as NSString
                return removeKdigits(tmp, k - 1)
            }
        }
    }
    let tmp = num.substring(to: num.length - 1) as NSString
    return removeKdigits(tmp, k - 1)
}
