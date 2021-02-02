//
//  424. 替换后的最长重复字符.swift
//  LeetCode
//
//  Created by 李坤 on 2021/2/2.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
/**
 给你一个仅由大写英文字母组成的字符串，你可以将任意位置上的字符替换成另外的字符，总共可最多替换 k 次。在执行上述操作后，找到包含重复字母的最长子串的长度。

 注意：字符串长度 和 k 不会超过 104。

  

 示例 1：

 输入：s = "ABAB", k = 2
 输出：4
 解释：用两个'A'替换为两个'B',反之亦然。
 示例 2：

 输入：s = "AABABBA", k = 1
 输出：4
 解释：
 将中间的一个'A'替换为'B',字符串变为 "AABBBBA"。
 子串 "BBBB" 有最长重复字母, 答案为 4。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-repeating-character-replacement
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func characterReplacement(_ s: String, _ k: Int) -> Int {
    var counts = Array(repeating: 0, count: 26)
    var left = 0
    var right = 0
    var maxCount = 0
    let chars = s.utf8CString
    let charsCount = chars.count - 1
    while right < charsCount {
        let index = Int(chars[right] - 65)
        counts[index] += 1
        maxCount = max(maxCount, counts[index])
        right += 1
        if right - left - maxCount - k > 0 {
            counts[Int(chars[left] - 65)] -= 1
            left += 1
        }
    }
    return right - left
}
