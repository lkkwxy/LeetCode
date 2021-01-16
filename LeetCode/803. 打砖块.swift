//
//  803. 打砖块.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/16.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
class Solution2 {
    func hitBricks(_ grid: [[Int]], _ hits: [[Int]]) -> [Int] {
        var copy = grid
        let row = grid.count
        let col = grid[0].count
        let size = row * col
        let unionFind = UnionFind(count: size + 1)
        let directions = [[0,1], [1,0], [-1, 0], [0,-1]]
        let getIndex = { (x: Int, y: Int) -> Int in
            return x * col + y
        }
        for hit in hits {
            copy[hit[0]][hit[1]] = 0
        }
        for i in 0..<col {
            if copy[0][i] == 1 {
                unionFind.union(num1: getIndex(0, i), num2: size)
            }
        }
        for i in 1..<row {
            for j in 0..<col where copy[i][j] == 1{
                let cur = getIndex(i, j)
                if j > 0 && copy[i][j - 1] == 1 {
                    unionFind.union(num1: cur, num2: getIndex(i, j - 1))
                }
                if copy[i - 1][j] == 1 {
                    unionFind.union(num1: cur, num2: getIndex(i - 1, j))
                }
            }
        }
        var res = Array(repeating: 0, count: hits.count)
        for i in stride(from: hits.count - 1, to: -1, by: -1) {
            let hit = hits[i]
            if grid[hit[0]][hit[1]] == 0 {
                continue
            }
            let ori = unionFind.getSize(with: size)
            if hit[0] == 0 {
                unionFind.union(num1: getIndex(0, hit[1]), num2: size)
            }
            for direction in directions {
                let x = hit[0] + direction[0]
                let y = hit[1] + direction[1]
                if x >= 0 && y >= 0 && x < row && y < col && copy[x][y] == 1 {
                    unionFind.union(num1: getIndex(hit[0], hit[1]), num2: getIndex(x, y))
                }
            }
            let cur = unionFind.getSize(with: size)
            res[i] = max(cur - ori - 1, 0)
            copy[hit[0]][hit[1]] = 1
        }
        return res
    }
}

private class UnionFind {
    private var size: [Int]
    private var parent: [Int]
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
        self.size = Array(repeating: 1, count: count)
        for i in 0..<count {
            parent[i] = i
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
            if fnum1 >= 45 {
                print("---------")
            }
            parent[fnum1] = fnum2
            size[fnum2] += size[fnum1]
        }
    }
    
    func getSize(with num:Int) -> Int {
        return size[find(num: num)]
    }
}
