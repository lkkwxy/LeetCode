//
//  222. 完全二叉树的节点个数.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/24.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func countNodes(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    var left = root
    var right = root
    var leftHeight = 0
    var rightHeight = 0
    while left != nil {
        left = left?.left
        leftHeight += 1
    }
    
    while right != nil {
        right = right?.right
        rightHeight += 1
    }
    
    if leftHeight == rightHeight {
        return 1 << leftHeight - 1
    }
    return 1 + countNodes(root?.left) + countNodes(root?.right)
}
func countNodes1(_ root: TreeNode?) -> Int {
    var cur = root
    var level = -1
    while cur != nil {
        level += 1
        cur = cur?.left
    }
    if level < 0 {
        return 0
    }
    var low = 0
    var high = 1 << level - 1
    var mid = (high - low) / 2 + low
    while low <= high {
        if exist(level: level, k: mid, root: root) {
            low = mid + 1
            mid = (high - low) / 2 + low
        } else {
            high = mid - 1
            mid = (high - low) / 2 + low
        }
    }
    return 1 << level + low - 1
    
}

func exist(level: Int, k: Int, root: TreeNode?) -> Bool {
    var bits = 1 << (level - 1)
    var cur = root
    while cur != nil && bits != 0 {
        if k & bits == 0 {
            cur = cur?.left
        } else {
            cur = cur?.right
        }
        bits >>= 1
    }
    return cur != nil
}
