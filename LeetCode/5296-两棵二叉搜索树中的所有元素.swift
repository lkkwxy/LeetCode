//
//  5296-两棵二叉搜索树中的所有元素.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/29.
//  Copyright © 2019 李坤坤. All rights reserved.
//


import Foundation
func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
    let treeNodeToArray = { (root: TreeNode?) -> [Int] in
        guard let root = root else{ return [] }
        var currentNode = root.left
        var sortArray = [Int]()
        var stack = [root]
        while stack.count > 0 || currentNode != nil{
            if let leftNode = currentNode?.left {
                stack.append(currentNode!)
                currentNode = leftNode
            }else {
                if let node = currentNode {
                    sortArray.append(node.val)
                    currentNode = node.right
                }else if let node = stack.popLast(){
                    sortArray.append(node.val)
                    currentNode = node.right
                }
            }
        }
        return sortArray
    }
    let sortArray1 = treeNodeToArray(root1)
    let sortArray2 = treeNodeToArray(root2)
    let sortArray1Count = sortArray1.count
    let sortArray2Count = sortArray2.count
    var result = Array(repeating: 0, count: sortArray1Count + sortArray2Count)
    var i = 0 ,j = 0
    while i < sortArray1Count && j < sortArray2Count{
        if sortArray1[i] < sortArray2[j] {
            result[i + j] = sortArray1[i]
            i += 1
        }else {
            result[i + j] = sortArray2[j]
            j += 1
        }
    }
    if i == sortArray1Count {
        result[i + j..<sortArray1Count+sortArray2Count] = sortArray2[j..<sortArray2Count]
    }else {
        result[i + j..<sortArray1Count+sortArray2Count] = sortArray1[i..<sortArray1Count]
    }
    return result
}
