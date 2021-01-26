//
//  959. 由斜杠划分区域.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/25.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func regionsBySlashes(_ grid: [String]) -> Int {
    guard grid.count > 0 else {
        return 0
    }
    let m = grid.count
    let n = grid[0].count
    let unionFind = UnionFind(count: m * n * 4)
    for i in 0..<m {
        for (j, value) in grid[i].enumerated() {
            let index = (i * m + j) * 4
            if value == " "  {
                unionFind.union(num1: index, num2: index + 1)
                unionFind.union(num1: index, num2: index + 2)
                unionFind.union(num1: index, num2: index + 3)
            } else if value == "/" {
                unionFind.union(num1: index, num2: index + 3)
                unionFind.union(num1: index + 1, num2: index + 2)
            } else if value == "\\" {
                unionFind.union(num1: index, num2: index + 1)
                unionFind.union(num1: index + 2, num2: index + 3)
            }
            if j > 0 {
                unionFind.union(num1: index + 3, num2: index - 3)
            }
            if i > 0 {
                unionFind.union(num1: index, num2: index - m * 4  + 2)
            }
        }
    }
    return unionFind.size
}

private class UnionFind {
    private var parent: [Int]
    private var rank: [Int]
    private(set) var size: Int
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
        self.rank = Array(repeating: 1, count: count)
        self.size = count
        for i in 0..<count {
            parent[i] = i
        }
    }
    
    func  find(num: Int) -> Int {
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
        parent[fnum1] = fnum2
        rank[fnum1] += rank[fnum2]
        size -= 1
        return true
    }
}
