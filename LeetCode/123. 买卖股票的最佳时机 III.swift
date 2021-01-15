//
//  123. 买卖股票的最佳时机 III.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/9.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func maxProfit3(_ prices: [Int]) -> Int {
    var buy1 = -prices[0]
    var buy2 = -prices[0]
    var shell1 = 0
    var shell2 = 0
    for i in 1..<prices.count {
        let price = prices[i]
        buy1 = max(buy1, -price)
        shell1 = max(shell1, buy1 + price)
        buy2 = max(buy2, shell1 - price)
        shell2 = max(shell2, buy2 + price)
    }
    return shell2
}
