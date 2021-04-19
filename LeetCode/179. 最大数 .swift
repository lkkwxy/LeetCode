//
//  179. 最大数 .swift
//  LeetCode
//
//  Created by 李坤 on 2021/4/12.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func largestNumber(_ nums: [Int]) -> String {
    let nums = nums.map { (num) -> [Int] in
        if(num == 0) {
            return [0]
        }
        var tmps = [Int]()
        var num = num
        while num != 0 {
            tmps.append(num % 10)
            num = num / 10
        }
        return tmps.reversed()
    }
    let sortNums = nums.sorted { (item1, item2) -> Bool in
        var item1 = item1
        var item2 = item2
        var res = true
        if item2.count > item1.count {
            (item2, item1) = (item1, item2)
            res = false
        }
        let count = min(item1.count, item2.count)
        for i in 0..<count {
            if item1[i] > item2[i] {
                return res
            } else if item1[i] < item2[i] {
                return !res
            }
        }
        if(item1.count > count) {
            for i in count..<item1.count {
                for j in 0..<count {
                    if (item1[i] > item1[j]) {
                        return res
                    } else if item1[i] < item1[j] {
                        return !res
                    }
                }
               
            }
        }
        return true
    }
    let res = sortNums.reduce("") { (res, item) -> String in
        return res + item.reduce("", { (res, item) -> String in
            return res + "\(item)"
        })
    }
    if res.starts(with: "0") {
        return "0"
    }
    return res
}
