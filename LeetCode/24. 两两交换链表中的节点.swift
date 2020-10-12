//
//  24. 两两交换链表中的节点.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/10/13.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func swapPairs(_ head: ListNode?) -> ListNode? {
    var perviousNode: ListNode?
    let resultNode = head?.next ?? head
    var currentNode = head
    while currentNode != nil && currentNode?.next != nil {
            perviousNode?.next = currentNode?.next
            let nextNode = currentNode?.next?.next
            currentNode?.next?.next = currentNode
            currentNode?.next = nextNode
            perviousNode = currentNode
            currentNode = nextNode
    }
    return resultNode
}
