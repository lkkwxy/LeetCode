//
//  200. 岛屿数量.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/19.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
/**
 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

 岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

 此外，你可以假设该网格的四条边均被水包围。

  

 示例 1：

 输入：grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 输出：1
 示例 2：

 输入：grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 输出：3
  

 提示：

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 300
 grid[i][j] 的值为 '0' 或 '1'

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-islands
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func numIslands(_ grid: [[Character]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    let unionFind = UnionFind(count: m * n)
    for i in 0..<m {
        for j in 0..<n {
            if grid[i][j] == "1" {
                let index = i * n + j
                if i > 0 && grid[i - 1][j] == "1" {
                    unionFind.union(num1: index, num2: index - n)
                }
                if j > 0 && grid[i][j - 1] == "1" {
                    unionFind.union(num1: index, num2: index - 1)
                }
            }
        }
    }
    let rootCount = unionFind.rootCount()
    var zeroCount = 0
    for i in 0..<m {
        for j in 0..<n {
            if grid[i][j] == "0" {
                zeroCount += 1
            }
        }
    }
    return rootCount - zeroCount
}

private class UnionFind {
    private var parent: [Int]
    init(count: Int) {
        parent = Array(repeating: 0, count: count)
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
            parent[fnum1] = fnum2
        }
    }
    
    func rootCount() -> Int {
        var res = 0
        for i in 0..<parent.count where i == parent[i]{
            res += 1
        }
        return res
    }
}
