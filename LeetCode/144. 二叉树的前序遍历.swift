//
//  144. 二叉树的前序遍历.swift
//  LeetCode
//
//  Created by 李坤 on 2020/10/27.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
/**
 给定一个二叉树，返回它的 前序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
///遍历方式
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var currentNode = root
    var result = [Int]()
    var stack = [TreeNode]()
    while currentNode != nil {
        result.append(currentNode!.val)
        if let rightNode = currentNode?.right {
            stack.append(rightNode)
        }
        currentNode = currentNode?.left
        if currentNode == nil {
            currentNode = stack.popLast()
        }
    }
    return result
}
/// 递归方式
func preorderTraversal1(_ root: TreeNode?) -> [Int] {
    guard let node = root else {
        return []
    }
    var result = [node.val]
    result.append(contentsOf: preorderTraversal(node.left))
    result.append(contentsOf: preorderTraversal(node.right))
    return result
}
