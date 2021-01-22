//
//  1489. 找到最小生成树里的关键边和伪关键边.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/21.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
    let m = edges.count
    var lines = Array(repeating: (0,0,0,0), count: m)
    let unionFind = UnionFind(count: n)
    for i in 0..<m {
        let edge = edges[i]
        lines[i] = (edge[0], edge[1], edge[2], i)
    }
    lines.sort { $0.2 < $1.2 }
    var minValue = 0
    var lineCount = 1
    for line in lines {
        if unionFind.union(num1: line.0, num2: line.1) {
            minValue += line.2
            lineCount += 1
        }
        if lineCount == n {
            break
        }
    }
    var criticals = [Int]()
    var pseudoCriticals = [Int]()
    for i in 0..<m {
        var unionFind = UnionFind(count: n)
        var value = 0
        for j in 0..<m {
            let line = lines[j]
            if i != j &&  unionFind.union(num1: line.0, num2: line.1) {
                value += line.2
            }
        }
        if unionFind.sizeCount > 1 || value > minValue {
            criticals.append(lines[i].3)
            continue
        }
        unionFind = UnionFind(count: n)
        let _ = unionFind.union(num1: lines[i].0, num2: lines[i].1)
        value = lines[i].2
        for j in 0..<m {
            let line = lines[j]
            if i != j &&  unionFind.union(num1: line.0, num2: line.1) {
                value += line.2
                lineCount += 1
            }
        }
        if value == minValue {
            pseudoCriticals.append(lines[i].3)
        }
        
    }
    return [criticals, pseudoCriticals]
}

private class UnionFind {
    var parent: [Int]
    var rank: [Int]
    var sizeCount: Int
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
        self.rank = Array(repeating: 1, count: count)
        sizeCount = count
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
    
    func union(num1: Int, num2: Int) -> Bool {
        var fnum1 = find(num: num1)
        var fnum2 = find(num: num2)
        if fnum1 == fnum2 {
            return false
        }
        if rank[fnum1] > rank[fnum2] {
            (fnum1, fnum2) = (fnum2, fnum1)
        }
        parent[fnum1] = fnum2
        sizeCount -= 1
        rank[fnum2] += rank[fnum1]
        return true
    }
}
