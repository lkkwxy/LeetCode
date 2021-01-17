//
//  721. 账户合并.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/18.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation

func accountsMerge(_ accounts: [[String]]) -> [[String]] {
    var emailMap = [String: Int]()
    let unionFind = UniodFind(count: accounts.count)
    for (index, account) in accounts.enumerated() {
        for i in 1..<account.count {
            let email = account[i]
            if let existIndex = emailMap[email] {
                unionFind.union(num1: existIndex, num2: index)
            } else {
                emailMap[email] = index
            }
        }
    }
    var res = [[String]]()
    var indexSet = Set<Int>()
    for i in 0..<accounts.count where !indexSet.contains(i){
        let indexs = unionFind.findNums(num: i)
        indexSet.formUnion(indexs)
        var emailSet = Set<String>()
        for index in indexs {
            let count = accounts[index].count
            emailSet.formUnion(accounts[index][1..<count])
        }
        var account = [accounts[indexs[0]][0]]
        account.append(contentsOf: Array(emailSet).sorted())
        res.append(account)
    }
    return res
}


private class UniodFind {
    var parent: [Int]
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
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
    
    func findNums(num: Int) -> [Int] {
        let root = find(num: num)
        var res = [Int]()
        for (index, value) in parent.enumerated() {
            if find(num: value) == root {
                res.append(index)
            }
        }
        return res
    }
    
    func union(num1: Int, num2: Int) {
        let fnum1 = find(num: num1)
        let fnum2 = find(num: num2)
        if fnum1 != fnum2 {
            parent[fnum1] = fnum2
        }
    }
}
