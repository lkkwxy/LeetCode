//
//  57. 插入区间.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/11/4.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
/**
 给出一个无重叠的 ，按照区间起始端点排序的区间列表。

 在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。

  

 示例 1：

 输入：intervals = [[1,3],[6,9]], newInterval = [2,5]
 输出：[[1,5],[6,9]]
 示例 2：

 输入：intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 输出：[[1,2],[3,10],[12,16]]
 解释：这是因为新的区间 [4,8] 与 [3,5],[6,7],[8,10] 重叠。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/insert-interval
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result = intervals
    var insertIndex = -1
    for i in 0..<intervals.count {
        let item = intervals[i]
        if newInterval[1] <= item[0] {
            insertIndex = i
            result.insert(newInterval, at: i)
            break
        }
        
        if newInterval[0] > item[0] && newInterval[0] < item[1] || (newInterval[1] > item[0] && newInterval[1] < item[1]) {
            insertIndex = i
            result[i] = [min(newInterval[0], item[0]), max(newInterval[1], item[1])]
            break
        }
    }
    if insertIndex == -1 {
        result.append(newInterval)
        insertIndex = result.count - 1
    }
    var removeIndex = -1
    var minValue = result[insertIndex][0]
    for i in stride(from: insertIndex, to: -1, by: -1) {
        if minValue <= result[i][1] {
            removeIndex = i
            minValue = min(minValue, result[i][0])
        } else {
            break
        }
    }
    if removeIndex != -1 {
        result[removeIndex...insertIndex] = [[minValue, result[insertIndex][1]]]
        insertIndex = removeIndex
    }
    var maxValue = result[insertIndex][1]
    removeIndex = -1
    for i in removeIndex+1..<result.count {
        if maxValue >= result[i][0] {
            removeIndex = i
            maxValue = max(maxValue, result[i][1])
        } else {
            break
        }
    }
    if removeIndex != -1 {
        result[insertIndex...removeIndex] = [[result[insertIndex][0], maxValue]]
    }
    return result
}
