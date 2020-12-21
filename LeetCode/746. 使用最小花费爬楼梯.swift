//
//  746. 使用最小花费爬楼梯.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/21.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
class Solution {
    /// 解法1：动态规划
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        if cost.count < 2 {
            return 0
        }
        var dp = Array(repeating: 0, count: cost.count + 1)
        for i in 2...cost.count {
            dp[i] = min(dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2])
        }
        return dp[cost.count]
    }
    
    /// 解法2：递归
    func minCostClimbingStairs1(_ cost: [Int]) -> Int {
        return minCostClimbingStairs(cost, 0)
    }
    var map = [Int: Int]()
    func minCostClimbingStairs(_ cost: [Int], _ startIndex: Int) -> Int {
        if let res = self.map[startIndex] {
            return res
        }
        if cost.count - 1 == startIndex {
            return 0
        } else if cost.count - 2 == startIndex {
            return min(cost[startIndex],cost[startIndex + 1])
        }
        let res1 = cost[startIndex] + minCostClimbingStairs(cost, startIndex + 1)
        let res2 = cost[startIndex + 1] + minCostClimbingStairs(cost, startIndex + 2)
        let res = min(res1,res2)
        map[startIndex] = res
        return res
    }
}
