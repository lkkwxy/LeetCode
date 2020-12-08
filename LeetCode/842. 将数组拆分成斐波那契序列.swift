//
//  842. 将数组拆分成斐波那契序列.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/8.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
/**
 给定一个数字字符串 S，比如 S = "123456579"，我们可以将它分成斐波那契式的序列 [123, 456, 579]。

 形式上，斐波那契式序列是一个非负整数列表 F，且满足：

 0 <= F[i] <= 2^31 - 1，（也就是说，每个整数都符合 32 位有符号整数类型）；
 F.length >= 3；
 对于所有的0 <= i < F.length - 2，都有 F[i] + F[i+1] = F[i+2] 成立。
 另外，请注意，将字符串拆分成小块时，每个块的数字一定不要以零开头，除非这个块是数字 0 本身。

 返回从 S 拆分出来的任意一组斐波那契式的序列块，如果不能拆分则返回 []。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/split-array-into-fibonacci-sequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func subDigit(nums: [Int], start: Int, end: Int) -> Int {
    var res = 0
    for i in start..<end {
        res = res * 10 + nums[i]
        if res > Int32.max {
            return -1
        }
    }
    return res
}

func backtrack(nums: [Int], res: inout [Int], index: Int) -> Bool {
    if index == nums.count && res.count >= 3 {
        return true
    }
    for i in index..<nums.count {
        if nums[i] == 0 && i > index {
            break
        }
        let num = subDigit(nums: nums, start: index, end: i + 1)
        if num == -1 {
            break
        }
        if res.count >= 2 && num > res[res.count - 2] + res[res.count - 1] {
            break
        }
        if res.count < 2 || num == res[res.count - 2] + res[res.count - 1] {
            res.append(num)
            if backtrack(nums: nums, res: &res, index: i + 1) {
                return true
            }
            let _ = res.popLast()
        }
    }
    return false
}

func splitIntoFibonacci(_ S: String) -> [Int] {
    
    return []
}
