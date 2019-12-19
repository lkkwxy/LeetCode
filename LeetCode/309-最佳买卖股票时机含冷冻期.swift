//
//  309-最佳买卖股票时机含冷冻期.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/18.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
// 思路：买卖股票一共有三种状态，购买，卖出，持有（冻结）
// 状态的变化，最开始只能有购买或持有
// 购买的下一个状态是持有或者卖出
// 卖出的下一个状态是持有
// 从卖出转到持有的下一个状态是持有或购买
// 从购买转到持有的下一个状态是持有或卖出
// 最大收益等于当前的操作加上接下来操作产生的最大值


enum TradingStatus {
    case purchase
    case frozen(Bool)
    case sell
    func next() -> [TradingStatus] {
        switch self {
        case .purchase:
            return [.frozen(false), .sell]
        case .sell:
            return [.frozen(true)]
        case .frozen(let isSell):
            return isSell ? [.frozen(isSell), .purchase] : [.frozen(isSell), .sell]
        }
    }
    func toString() -> String {
        switch self {
        case .purchase:
            return "purchase"
        case .sell:
            return "sell"
        case .frozen(let isSell):
            return "frozen\(isSell)"
        }
    }
}
var map = [String:Int]()

func maxProfit(_ prices: [Int]) -> Int {
    return max(maxProfit(.purchase, 0, prices), maxProfit(.frozen(true), 0, prices))
}

func maxProfit(_ status:TradingStatus, _ startIndex:Int ,_ prices: [Int]) -> Int{
    guard startIndex < prices.count else { return 0 }
    let key = status.toString() + "\(startIndex)"
    if let value = map[key] {
        return value
    }
    var income = 0
    let nextStatus = status.next()
    switch status {
    case .purchase:
        income = -prices[startIndex]
    case .sell:
        income = prices[startIndex]
    case .frozen(_):
        income = 0
    }
    if nextStatus.count == 1 {
        let value = maxProfit(nextStatus[0], startIndex + 1, prices) + income
        map[key] = value
        return value
    }else {
        let firstValue = maxProfit(nextStatus[0], startIndex + 1, prices) + income
        let secondValue =  maxProfit(nextStatus[1], startIndex + 1, prices) + income
        let maxValue = max(firstValue, secondValue)
        map[key] = maxValue
        return maxValue
    }
}
