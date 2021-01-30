//
//  839. 相似字符串组.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/31.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func numSimilarGroups(_ strs: [String]) -> Int {
    let count = strs.count
    let unionFind = UnionFind(count: count)
    for i in 0..<count {
        for j in i + 1..<count {
            if !unionFind.isConnect(num1: i, num2: j) &&
                isSimilar(str1: strs[i], str2: strs[j]) {
                unionFind.union(num1: i, num2: j)
            }
        }
    }
    return unionFind.size
}

func isSimilar(str1: String, str2: String) -> Bool {
    let chars1 = str1.utf8CString
    let chars2 = str2.utf8CString
    if chars1.count != chars2.count {
        return false
    }
    var notEqualCount = 0
    var notEqualChar: (CChar, CChar, CChar, CChar) = (0,0,1,1)
    for i in 0..<chars1.count {
        if chars1[i] != chars2[i] {
            notEqualCount += 1
            if notEqualCount == 1 {
                notEqualChar.0 = chars1[i]
                notEqualChar.1 = chars2[i]
            } else if notEqualCount == 2 {
                notEqualChar.2 = chars1[i]
                notEqualChar.3 = chars2[i]
            } else {
                return false
            }
        }
    }
    if notEqualCount == 0 {
        return true
    }
    return notEqualChar.0 == notEqualChar.3 && notEqualChar.1 == notEqualChar.2
}

private class UnionFind {
    private var parent: [Int]
    private(set) var size: Int
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
        self.size = count
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
            size -= 1
        }
    }
    func isConnect(num1: Int, num2: Int) -> Bool {
        return find(num: num1) == find(num: num2)
    }

}
