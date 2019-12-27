//
//  删除链表中等于某个值得所有节点.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/28.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func remove(with value:Int, from listNode:ListNode?) -> ListNode? {
    let tmpNode = ListNode(0)
    tmpNode.next = listNode
    var currentNode = tmpNode.next
    var persiousNode:ListNode? = tmpNode
    while currentNode != nil {
        if let nodeValue = currentNode?.val, nodeValue == value {
            persiousNode?.next = currentNode?.next
        }else {
            persiousNode = currentNode
        }
        currentNode = currentNode?.next
    }
    return tmpNode.next
}
