//
//  783. 二叉搜索树节点最小距离.swift
//  LeetCode
//
//  Created by 李坤 on 2021/4/13.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func minDiffInBST(_ root: TreeNode?) -> Int {
    var curNode = root
    var values = [Int]()
    var nodes = [TreeNode]()
    while curNode != nil || !nodes.isEmpty {
        if let node = curNode {
            nodes.append(node)
            curNode = node.left
        } else {
            let node = nodes.removeLast()
            values.append(node.val)
            curNode = node.right
        }
    }
    let count = values.count
    if count <= 1 { return 0 }
    var mininumDifference = values[1] - values[0]
    for i in 1..<count-1 {
        let differenceValue = values[i + 1] - values[i]
        if differenceValue < mininumDifference {
            mininumDifference  = differenceValue
        }
    }
    return mininumDifference
}
