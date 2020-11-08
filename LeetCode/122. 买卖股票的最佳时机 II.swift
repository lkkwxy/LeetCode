//
//  122. 买卖股票的最佳时机 II.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/8.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func maxProfit1(_ prices: [Int]) -> Int {
    var result = 0
    for i in 1..<prices.count {
        if prices[i] > prices[i - 1] {
            result += prices[i] - prices[i - 1]
        }
    }
    return result
}
