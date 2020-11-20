//
//  147. 对链表进行插入排序.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/20.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation


func insertionSortList(_ head: ListNode?) -> ListNode? {
    var head = head
    var current = head?.next
    head?.next = nil
    var pervious: ListNode?
    while let node = current {
        let val = node.val
        current = node.next
        if val < head!.val {
            node.next = head
            head = node
            continue
        }
        if let node = pervious, val < node.val {
            pervious = head
        }
        while let node = pervious?.next {
            if node.val > val {
                break
            }
            pervious = node
        }
        node.next = pervious?.next
        pervious?.next = node
        
    }
    return head
}
