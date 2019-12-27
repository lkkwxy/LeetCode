//
//  Common.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/12.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    var hasCycle: Bool {
        var slow:ListNode? = self
        var fast = self.next
        while fast != nil {
            if slow! === fast! {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
    func remove(with value:Int) {
        let tmpNode = ListNode(0)
        tmpNode.next = self
        tmpNode.next = nil
    }
}


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

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

func ListNodeTest() {
    let array = [3,2,5,0,4,4,5,6,5,5]
    let head = ListNode(5)
    var next = head
    for item in array {
        let tmp = ListNode(item)
        next.next = tmp
        next = tmp
    }
    let h = remove(with: 5, from: head)
//    head.remove(with: 5)
    print(head)
}
