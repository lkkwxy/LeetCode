//
//  100-相同的树.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/28.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard let pNode = p ,let qNode = q else { return q == nil && p == nil }
    return pNode.val == qNode.val && isSameTree(pNode.left, qNode.left) && isSameTree(pNode.right, qNode.right)
}
