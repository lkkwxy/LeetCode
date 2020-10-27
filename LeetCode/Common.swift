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
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
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



