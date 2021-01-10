//
//  396. 旋转函数.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/7.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
/**
 给定一个长度为 n 的整数数组 A 。

 假设 Bk 是数组 A 顺时针旋转 k 个位置后的数组，我们定义 A 的“旋转函数” F 为：

 F(k) = 0 * Bk[0] + 1 * Bk[1] + ... + (n-1) * Bk[n-1]。

 计算F(0), F(1), ..., F(n-1)中的最大值。

 注意:
 可以认为 n 的值小于 105。

 示例:

 A = [4, 3, 2, 6]

 F(0) = (0 * 4) + (1 * 3) + (2 * 2) + (3 * 6) = 0 + 3 + 4 + 18 = 25
 F(1) = (0 * 6) + (1 * 4) + (2 * 3) + (3 * 2) = 0 + 4 + 6 + 6 = 16
 F(2) = (0 * 2) + (1 * 6) + (2 * 4) + (3 * 3) = 0 + 6 + 8 + 9 = 23
 F(3) = (0 * 3) + (1 * 2) + (2 * 6) + (3 * 4) = 0 + 2 + 12 + 12 = 26

 所以 F(0), F(1), F(2), F(3) 中的最大值是 F(3) = 26 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-function
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func maxRotateFunction(_ A: [Int]) -> Int {
    let sum = A.reduce(0) { $0 + $1}
    var curr = 0
    for (index,value) in A.enumerated() {
        curr += index * value
    }
    let count = A.count
    var res = curr
    var i = 1
    while i < count {
        curr = curr + A[i - 1] * count - sum
        res = max(res, curr)
        i += 1
    }
    return res
}
