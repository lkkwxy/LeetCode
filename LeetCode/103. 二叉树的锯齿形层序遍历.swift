//
//  103. 二叉树的锯齿形层序遍历.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/27.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var res = [[Int]]()
    guard let root = root else {
        return res
    }
    var isFromLeft = true
    var stack = [root]
    while !stack.isEmpty {
        var tmp = [TreeNode]()
        var tmpRes = Array(repeating: 0, count: stack.count)
        for index in 0..<stack.count {
            let item = stack[index]
            tmpRes[index] = item.val
            if let left = item.left {
                tmp.append(left)
            }
            if let right = item.right {
                tmp.append(right)
            }
        }
        if isFromLeft {
            res.append(tmpRes)
        } else {
            res.append(tmpRes.reversed())
        }
        stack = tmp
        
        isFromLeft.toggle()
    }
    return res
}
