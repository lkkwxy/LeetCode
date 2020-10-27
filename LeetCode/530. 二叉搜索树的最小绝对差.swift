//
//  11.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/10/12.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func getMinimumDifference(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var nodes = [TreeNode]()
    var values = [Int]()
    var currentNode: TreeNode? = root
    
    while nodes.count != 0 || currentNode != nil {
        if let node = currentNode {
            nodes.append(node)
            currentNode = currentNode?.left
        } else {
            let node = nodes.removeLast()
            values.append(node.val)
            currentNode = node.right
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
