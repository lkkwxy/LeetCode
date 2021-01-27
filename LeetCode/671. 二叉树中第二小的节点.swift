//
//  671. 二叉树中第二小的节点.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/27.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findSecondMinimumValue(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return -1
    }
    let minVal = root.val
    var res = -1
    var array = [root]
    while !array.isEmpty {
        var tmp = [TreeNode]()
        for node in array {
            if let left = node.left, let right = node.right {
                if left.val == minVal {
                    tmp.append(left)
                } else {
                    res = res == -1 ? left.val : min(res, left.val)
                }
                
                if right.val == minVal {
                    tmp.append(right)
                }else {
                    res = res == -1 ? right.val : min(res, right.val)
                }
                
            }
        }
        array = tmp
    }
    return res
}
