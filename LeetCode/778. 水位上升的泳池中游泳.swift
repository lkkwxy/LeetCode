//
//  778. 水位上升的泳池中游泳.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/30.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func swimInWater(_ grid: [[Int]]) -> Int {
    let dirs = [(0,1), (1,0), (-1,0), (0,-1)]
    var heights = [Int: (Int, Int)]()
    let m = grid.count
    let n = grid[0].count
    for i in 0..<m {
        for j in 0..<n {
            heights[grid[i][j]] = (i, j)
        }
    }
    let unionFind = UnionFind(count: m * n)
    let start = grid[0][0]
    let end = grid[m - 1][n - 1]
    for k in 0..<m * n {
        let height = heights[k]!
        let i = height.0
        let j = height.1
        for dir in dirs {
            let curi = i + dir.0
            let curj = j + dir.1
            if curi >= 0 && curi < m && curj >= 0 && curj < n {
                if grid[curi][curj] < k {
                    print("\(k)=====\(grid[curi][curj])")
                    unionFind.union(num1: k, num2: grid[curi][curj])
                }
            }
        }
        if unionFind.isConnect(num1: start, num2: end) {
            return k
        }
    }
    return 0
}

private class UnionFind {
    private var parent: [Int]
    
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
        for i in 0..<count {
            self.parent[i] = i
        }
    }
    
    func find(num: Int) -> Int {
        if num != parent[num] {
            parent[num] = find(num: parent[num])
        }
        return parent[num]
    }
    
    func union(num1: Int, num2: Int) {
        let fnum1 = find(num: num1)
        let fnum2 = find(num: num2)
        if fnum1 != fnum2 {
            parent[fnum1] = fnum2
        }
    }
    
    func isConnect(num1: Int, num2: Int) -> Bool {
        return find(num: num1) == find(num: num2)
    }
}
