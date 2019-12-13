//
//  889-根据前序和后序遍历构造二叉树.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/13.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
//889-根据前序和后序遍历构造二叉树
func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
    let node = constructFromPrePost(pre,post,0,0,pre.count);
    return node
}

func constructFromPrePost(_ pre: [Int], _ post: [Int], _ preStart: Int, _ postStart: Int, _ count: Int) -> TreeNode? {
    guard count > 0 else { return nil }
    let root = TreeNode(pre[preStart])
    guard count > 1 else { return root }
    var splitIndex = -1
    for i in 1..<count {
        if pre[preStart + 1] == post[i + postStart - 1] {
            splitIndex = i
            break
        }
    }
    root.left = constructFromPrePost(pre, post, preStart + 1, postStart, splitIndex)
    root.right = constructFromPrePost(pre, post, preStart + splitIndex + 1, postStart + splitIndex, count - splitIndex - 1)
    return root;
}
