//
//  328. 奇偶链表.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/13.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func oddEvenList(_ head: ListNode?) -> ListNode? {
    var curEvenNode = head
    var lastEvenNode = head
    let oddHead = head?.next
    var curOddNode = oddHead
    while curEvenNode != nil {
        lastEvenNode = curEvenNode
        curEvenNode?.next = curEvenNode?.next?.next
        curOddNode?.next = curOddNode?.next?.next
        curEvenNode = curEvenNode?.next
        curOddNode = curOddNode?.next
    }
    lastEvenNode?.next = oddHead
    return head
}
