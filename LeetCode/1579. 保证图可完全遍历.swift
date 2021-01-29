//
//  1579. 保证图可完全遍历.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/27.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
    let unionFind = UnionFind(count: n + 1)
    unionFind.union(num1: 0, num2: 1)
    var res = 0
    for edge in edges {
        if edge[0] == 3 && !unionFind.union(num1: edge[1], num2: edge[2]) {
            res += 1
        }
    }
    let unionFindA = unionFind.copy()
    for edge in edges {
        if edge[0] == 1 && !unionFindA.union(num1: edge[1], num2: edge[2]) {
            res += 1
        }else if edge[0] == 2 && !unionFind.union(num1: edge[1], num2: edge[2]) {
            res += 1
        }
    }
    return unionFindA.size == 1 && unionFind.size == 1 ? res : -1
}

private class UnionFind {
    private var parent: [Int]
    private(set) var size: Int
    
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
        self.size = count
        for i in 0..<count {
            parent[i] = i
        }
    }
    
    private init(parent: [Int], size: Int) {
        self.parent = parent
        self.size = size
    }
    
    func find(num: Int) -> Int {
        if num != parent[num] {
            parent[num] = find(num: parent[num])
        }
        return parent[num]
    }
    
    @discardableResult
    func union(num1: Int, num2: Int) -> Bool {
        let fnum1 = find(num: num1)
        let fnum2 = find(num: num2)
        if fnum1 == fnum2 {
            return false
        }
        size -= 1
        parent[fnum1] = fnum2
        return true
    }
    
    func copy() -> UnionFind {
        return UnionFind(parent: parent, size: size)
    }
}

