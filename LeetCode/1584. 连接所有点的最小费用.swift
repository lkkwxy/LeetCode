//
//  1584. 连接所有点的最小费用.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/19.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func minCostConnectPoints(_ points: [[Int]]) -> Int {
    var distances = [(Int, Int, Int)]()
    let unionFind = UnionFind(count: points.count)
    for i in 0..<points.count {
        let curPoint = points[i]
        for j in i + 1..<points.count {
            let distance = abs(curPoint[0] - points[j][0]) + abs(curPoint[1] - points[j][1])
            distances.append((distance, i, j))
        }
    }
    distances = distances.sorted { $0.0 < $1.1 }
    var res = 0
    for distance in distances {
        if unionFind.union(num1: distance.1, num2: distance.2) {
            res += distance.0
        }
    }
    return res
}

private class UnionFind {
    private var parent: [Int]
    private var rank: [Int]
    
    init(count: Int) {
        parent = Array(repeating: 0, count: count)
        rank = Array(repeating: 1, count: count)
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
        if rank[fnum1] < rank[fnum2] {
            (fnum1, fnum2) = (fnum2, fnum1)
        }
        rank[fnum1] += rank[fnum2]
        parent[fnum1] = fnum2
        return true
    }
}
