//
//  204. 计数质数 .swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/3.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
/**
 统计所有小于非负整数 n 的质数的数量。

  

 示例 1：

 输入：n = 10
 输出：4
 解释：小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
 示例 2：

 输入：n = 0
 输出：0
 示例 3：

 输入：n = 1
 输出：0

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/count-primes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func countPrimes(_ n: Int) -> Int {
    if n < 2 {
        return 0
    }
    var array = Array(repeating: true, count: n + 1)
    array[0] = false
    array[1] = false
    let end = max(2, n / 2)
    for i in 2...end {
        if array[i] {
            var j = i + i
            while j < n {
                array[j] = false
                j += i
            }
        }
    }
    return array.reduce(0) { (res, item) -> Int in
        if item == true {
            return res + 1
        }
        return res
    }
}
