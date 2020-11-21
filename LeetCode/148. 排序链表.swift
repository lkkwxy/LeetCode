//
//  148. 排序链表.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/21.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func test111()  {
    let head = ListNode(4,ListNode(2,ListNode(1,ListNode(3))))
    let h = sortList(head)
    print("======")
}
func sortList(_ head: ListNode?) -> ListNode? {
    var cur = head
    var count = 0
    var subLength = 1
    while cur != nil {
        count += 1
        cur = cur?.next
    }
    let dummyNode = ListNode(0, head)
    while subLength < count {
        cur = dummyNode.next
        var perv: ListNode? = dummyNode
        while cur != nil {
            let head1 = cur
            for _ in 1..<subLength {
                cur = cur?.next
            }
            let head2 = cur?.next
            cur?.next = nil
            cur = head2
            for _ in 1..<subLength {
                cur = cur?.next
            }
            let tmp = cur?.next
            cur?.next = nil
            perv?.next = merget(head1, head2)
            while perv?.next != nil {
                perv = perv?.next
            }
            cur = tmp
            
        }
        subLength *= 2
    }
    return dummyNode.next
}
func sortList1(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else {
        return head
    }
    var slow = head
    var fast = head?.next
    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    let rightHead = slow?.next
    slow?.next = nil
    let left = sortList1(head)
    let right = sortList1(rightHead)
    return merget(left, right)
}


func merget(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
    var head1 = head1
    var head2 = head2
    let dummyHead = ListNode(0)
    var curNode: ListNode? = dummyHead
    while head1 != nil && head2 != nil {
        if head1!.val < head2!.val {
            curNode?.next = head1
            head1 = head1?.next
        } else {
            curNode?.next = head2
            head2 = head2?.next
        }
        curNode = curNode?.next
    }
    if head2 == nil {
        curNode?.next = head1
    } else {
        curNode?.next = head2
    }
    return dummyHead.next
}
