//
//  714. 买卖股票的最佳时机含手续费.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/12/17.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
    var buy = prices[0] + fee
    var profit = 0
    for i in 1..<prices.count {
        if prices[i] + fee < buy  {
            buy = prices[i] + fee
        } else if prices[i] > buy {
            profit += prices[i] - buy
            buy = prices[i]
        }
    }
    return profit
}
