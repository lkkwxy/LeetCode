//
//  1631. 最小体力消耗路径.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/29.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation

func minimumEffortPath(_ heights: [[Int]]) -> Int {
    var paths = [(Int, Int,Int)]()
    let m = heights.count
    let n = heights[0].count
    for i in 0..<m {
        for j in 0..<n {
            let index = i * n + j
            if i != m - 1 {
                paths.append((index, index + n, abs(heights[i + 1][j] - heights[i][j])))
            }
            if j != n - 1 {
                paths.append((index, index + 1, abs(heights[i][j + 1] - heights[i][j])))
            }
        }
    }
    let end = m * n - 1
    let union = UnionFind(count: m * n)
    paths = paths.sorted(by: {
        return $0.2 < $1.2
    })
    for path in paths {
        union.union(num1: path.0, num2: path.1)
        if union.isConnect(num1: 0, num2: end) {
            return path.2
        }
    }
    return 0
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
    
    func  find(num: Int) -> Int {
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
        parent[fnum1] = fnum2
        size -= 1
        return true
    }
    
    func isConnect(num1: Int, num2: Int) -> Bool {
        return find(num: num1) == find(num: num2)
    }
}
