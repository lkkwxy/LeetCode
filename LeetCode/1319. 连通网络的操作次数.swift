//
//  1319. 连通网络的操作次数.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/23.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
    guard connections.count >= n - 1 else {
        return -1
    }
    let unionFind = UnionFind(count: n)
    for connection in connections {
        unionFind.union(num1: connection[0], num2: connection[1])
    }
    return unionFind.size - 1
}

private class UnionFind {
    private var parent: [Int]
    private var rank: [Int]
    private(set) var size: Int
    
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
        self.rank = Array(repeating: 1, count: count)
        for i in 0..<count {
            parent[i] = i
        }
        size = count
    }
    
    func find(num: Int) -> Int {
        if num != parent[num] {
            parent[num] = find(num: parent[num])
        }
        return parent[num]
    }
    
    @discardableResult
    func union(num1: Int, num2: Int) -> Bool {
        var fnum1 = find(num: num1)
        var fnum2 = find(num: num2)
        if fnum1 == fnum2 {
            return false
        }
        if fnum1 > fnum2 {
            (fnum1, fnum2) = (fnum2, fnum1)
        }
        rank[fnum2] += rank[fnum1]
        size -= 1
        parent[fnum1] = fnum2
        return true
    }
}
