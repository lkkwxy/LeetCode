//
//  641. 设计循环双端队列.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/4.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
class MyCircularDeque {
    
    class Node {
        var val: Int
        var next: Node?
        var perv: Node?
        init(val: Int) {
            self.val = val
        }
    }
    
    private let capacity: Int
    private(set) var count = 0
    private let head = Node(val: -1)
    private let tail = Node(val: -1)
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        self.capacity = k
        self.head.next = self.tail
        self.head.perv = self.tail
        self.tail.perv = self.head
        self.tail.next = self.head
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        guard capacity > count else {
            return false
        }
        count += 1
        let node = Node(val: value)
        node.next = head.next
        node.perv = head
        head.next?.perv = node
        head.next = node
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        guard capacity > count else {
            return false
        }
        count += 1
        let node = Node(val: value)
        node.next = tail
        node.perv = tail.perv
        tail.perv?.next = node
        tail.perv = node
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        guard !isEmpty() else {
            return false
        }
        count -= 1
        let tmp = head.next
        head.next?.next?.perv = head
        head.next = head.next?.next
        tmp?.perv = nil
        tmp?.next = nil
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        guard !isEmpty() else {
            return false
        }
        count -= 1
        let tmp = tail.perv
        tail.perv?.perv?.next = tail
        tail.perv = tail.perv?.perv
        tmp?.next = nil
        tmp?.perv = nil
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        return head.next?.val ?? -1
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        return tail.perv?.val ?? -1
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return count == 0
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return count == capacity
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
