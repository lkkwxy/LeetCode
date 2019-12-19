//
//  303.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/19.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
class NumArray {
    var sumNums:[Int]
    init(_ nums: [Int]) {
        sumNums = [0]
        let _ = nums.reduce(0) { (perviousResult, num) -> Int in
            let result = perviousResult + num
            self.sumNums.append(result)
            return result
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return sumNums[j + 1] - sumNums[i]
    }
}
