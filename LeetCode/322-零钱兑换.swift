//
//  322-零钱兑换.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/20.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation

//解法1 
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount > 0 else {
        return 0
    }
    for coin in coins {
        if coin == amount { return 1 }
    }
    let coins = coins.filter { (coin) -> Bool in
        return coin < amount
    }
    var amountCounts = Array(repeating: -1, count: amount + 1)
    for i in 1...amount {
        var count = Int.max
        for coin in coins {
            if i > coin {
                if amountCounts[i - coin] > 0 {
                    count = min(count, amountCounts[i - coin] + 1)
                }
            }else if i == coin {
                count = 1
                break
            }
        }
        amountCounts[i] = count == Int.max ? -1 : count
    }
    return amountCounts[amount]
}

//解法2 
func coinChange1(_ coins: [Int], _ amount: Int) -> Int {
    guard amount > 0 else {
        return 0
    }
    var amountCounts = Array(repeating: -1, count: amount + 1)
    for coin in coins {
        if coin < amount {
            amountCounts[coin] = 1
        }
        if coin == amount { return 1 }
    }
    var coins = coins.filter { (coin) -> Bool in
        return coin < amount
    }
    coins.sort(by: >)
    let count = coinChange(coins, amount, &amountCounts)
    return count <= 0 ? -1 : count
}

func coinChange(_ coins: [Int], _ amount: Int, _ amountCounts: inout [Int]) -> Int {
    if amountCounts[amount] > 0 {
        return amountCounts[amount]
    }
    var minCount = Int.max
    for coin in coins where amount > coin{
        if amountCounts[amount - coin] > 0 {
            minCount = min(minCount, amountCounts[amount - coin] + 1)
        } else if amountCounts[amount - coin] != -2 {
            let count = coinChange(coins, amount - coin, &amountCounts)
            if count > 0 {
                minCount = min(minCount, count + 1)
            }
        }
    }
    minCount = minCount == Int.max ? -2 : minCount
    amountCounts[amount] = minCount
    return minCount
}
