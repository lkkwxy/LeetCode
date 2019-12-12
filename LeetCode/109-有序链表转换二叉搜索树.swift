//
//  109-有序链表转换二叉搜索树.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/12.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
//109-有序链表转换二叉搜索树
func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    var sortArray = [Int]()
    var head = head
    while head != nil {
        sortArray.append(head!.val)
        head = head?.next
    }
    return sortedArrayToBST(sortArray, start: 0, end: sortArray.count - 1)
}

func sortedArrayToBST(_ array: [Int], start: Int, end:Int) -> TreeNode? {
    guard end > start else { return nil }
    let mid = (start + end) / 2
    let treeNode = TreeNode(array[mid])
    treeNode.left = sortedArrayToBST(array, start: start, end: mid - 1)
    treeNode.right = sortedArrayToBST(array, start: mid + 1, end: end)
    return treeNode
}
