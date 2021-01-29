//
//  1356. 根据数字二进制下 1 的数目排序.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/6.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
/**
 给你一个整数数组 arr 。请你将数组中的元素按照其二进制表示中数字 1 的数目升序排序。

 如果存在多个数字二进制中 1 的数目相同，则必须将它们按照数值大小升序排列。

 请你返回排序后的数组。

  

 示例 1：

 输入：arr = [0,1,2,3,4,5,6,7,8]
 输出：[0,1,2,4,8,3,5,6,7]
 解释：[0] 是唯一一个有 0 个 1 的数。
 [1,2,4,8] 都有 1 个 1 。
 [3,5,6] 有 2 个 1 。
 [7] 有 3 个 1 。
 按照 1 的个数排序得到的结果数组为 [0,1,2,4,8,3,5,6,7]
 示例 2：

 输入：arr = [1024,512,256,128,64,32,16,8,4,2,1]
 输出：[1,2,4,8,16,32,64,128,256,512,1024]
 解释：数组中所有整数二进制下都只有 1 个 1 ，所以你需要按照数值大小将它们排序。
 示例 3：

 输入：arr = [10000,10000]
 输出：[10000,10000]
 示例 4：

 输入：arr = [2,3,5,7,11,13,17,19]
 输出：[2,3,5,17,7,11,13,19]
 示例 5：

 输入：arr = [10,100,1000,10000]
 输出：[10,100,10000,1000]
  

 提示：

 1 <= arr.length <= 500
 0 <= arr[i] <= 10^4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-integers-by-the-number-of-1-bits
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func sortByBits(_ arr: [Int]) -> [Int] {
    var map = [Int : Int]()
    let bisCount = { (num: Int) -> Int in
        if let count = map[num] {
            return count
        }
        var count = 0
        var tmp = num
        while tmp != 0 {
            count += 1
            tmp = tmp & (tmp - 1)
        }
        map[num] = count
        return count
    }
    return arr.sorted { (item1, item2) -> Bool in
        
        let bisCount1 = bisCount(item1)
        let bisCount2 = bisCount(item2)
        return bisCount1 == bisCount2 ? item1 < item2 : bisCount1 < bisCount2
    }
}
