//
//  515. 在每个树行中找最大值.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/14.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func largestValues(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    var result = [Int]()
    var nodes = [root]
    while !nodes.isEmpty {
        var tmpNodes = [TreeNode]()
        var max = nodes[0].val
        for node in nodes {
            if let leftNode = node.left {
                tmpNodes.append(leftNode)
            }
            if let rightNode = node.right {
                tmpNodes.append(rightNode)
            }
            if max < node.val {
                max = node.val
            }
        }
        nodes = tmpNodes
        result.append(max)
    }
    return result
}
