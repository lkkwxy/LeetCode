//
//  876-链表的中间结点.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/19.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func middleNode(_ head: ListNode?) -> ListNode? {
    var fastNode = head?.next
    var slowNode = head
    while fastNode != nil {
        fastNode = fastNode?.next?.next
        slowNode = slowNode?.next
    }
    return slowNode
}
