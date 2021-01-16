//
//  947. 移除最多的同行或同列石头 .swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/15.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func removeStones(_ stones: [[Int]]) -> Int {
    let unionFind = UnionFind()
    for stone in stones {
        unionFind.union(x: stone[0], y: stone[1] + 10000)
    }
    return stones.count - unionFind.count
}


private class UnionFind {
    private var parentMap = [Int: Int]()
    private(set) var count = 0
    
    func union(x: Int, y: Int) {
        let fx = find(num: x)
        let fy = find(num: y)
        if fx != fy {
            parentMap[fx] = fy
            count -= 1
        }
    }
    
    func find(num: Int) -> Int {
        if let res = parentMap[num] {
            if num != res {
                parentMap[num] = find(num: res)
            }
            return parentMap[num]!
        } else {
            parentMap[num] = num
            count += 1
            return num
        }
    }
}
