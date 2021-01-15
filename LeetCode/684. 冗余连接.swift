//
//  684. 冗余连接.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/13.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    let n = edges.count
    var parent = Array(repeating: 0, count: n + 1)
   
    let find = { (x: Int) -> Int in
        var cur = x
        while cur != parent[cur] {
            cur = parent[cur]
        }
        var tmp = x
        while tmp != parent[tmp] {
            (tmp, parent[tmp]) = (parent[tmp], cur)
        }
        return cur
    }
    let union = { (x: Int, y: Int) in
        let px = find(x)
        let py = find(y)
        if px != py {
            parent[px] = py
        }
    }
    for i in 0...n {
        parent[i] = i
    }
    for edge in edges {
        if find(edge[0]) == find(edge[1]) {
            return edge
        } else {
            union(edge[0], edge[1])
        }
    }
    return []
}
