//
//  967-连续差相同的数字.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/31.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
    guard N > 0 else { return [] }
    guard N > 1 else { return [0,1,2,3,4,5,6,7,8,9] }
    var result = [1,2,3,4,5,6,7,8,9]
    for _ in 2...N {
        var tmpResult = [Int]()
        for num in result {
            let singleDigit = num % 10
            if singleDigit + K < 10 {
                tmpResult.append(singleDigit + K + num * 10)
            }
            if singleDigit - K > -1 && K != 0{
                tmpResult.append(singleDigit - K + num * 10)
            }
        }
        result = tmpResult
    }
    return result
}
