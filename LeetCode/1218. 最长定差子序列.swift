//
//  1218. 最长定差子序列.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/26.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
/**
 给你一个整数数组 arr 和一个整数 difference，请你找出并返回 arr 中最长等差子序列的长度，该子序列中相邻元素之间的差等于 difference 。
 
  
 
 示例 1：
 
 输入：arr = [1,2,3,4], difference = 1
 输出：4
 解释：最长的等差子序列是 [1,2,3,4]。
 示例 2：
 
 输入：arr = [1,3,5,7], difference = 1
 输出：1
 解释：最长的等差子序列是任意单个元素。
 示例 3：
 
 输入：arr = [1,5,7,8,5,3,4,2,1], difference = -2
 输出：4
 解释：最长的等差子序列是 [7,5,3,1]。
  
 
 提示：
 
 1 <= arr.length <= 10^5
 -10^4 <= arr[i], difference <= 10^4
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-arithmetic-subsequence-of-given-difference
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
    var map = [arr[0]: 1]
    var maxCount = 1
    for i in 1..<arr.count {
        if let count = map[arr[i] - difference] {
            map[arr[i]] = count + 1
            maxCount = max(maxCount, count + 1)
        } else {
            map[arr[i]] = 1
        }
    }
    return maxCount
}
