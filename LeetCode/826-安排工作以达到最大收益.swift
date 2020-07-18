//
//  826-安排工作以达到最大收益.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/7/18.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
    var maxProfit = 0
    var currentMaxProfit = 0
    var profitInfo = [Int:Int]()
    for i in 0..<difficulty.count {
        if let p = profitInfo[difficulty[i]] {
            profitInfo[difficulty[i]] = max(profit[i], p)
        }else {
            profitInfo[difficulty[i]] = profit[i]
        }
        
    }
    let difficulty = difficulty.sorted()
    let worker = worker.sorted()
    var i = 0
    var j = 0
    while i < worker.count && j < difficulty.count {
        if worker[i] >= difficulty[j] {
            if profitInfo[difficulty[j]]! > currentMaxProfit {
                maxProfit += (worker.count - i) * profitInfo[difficulty[j]]!
                maxProfit -= (worker.count - i) * currentMaxProfit
                currentMaxProfit = profitInfo[difficulty[j]]!
            }
            j += 1
        }else {
            i += 1
        }
    }
    return maxProfit
}

