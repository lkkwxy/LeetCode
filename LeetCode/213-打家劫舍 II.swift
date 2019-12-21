//
//  213-打家劫舍 II.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/21.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
//[213-打家劫舍 II](https://leetcode-cn.com/problems/house-robber-ii/)
// 解法1
private var robMap = [String:Int]()
func rob(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    guard nums.count > 1 else { return nums[0] }
    guard nums.count > 2 else { return max(nums[0], nums[1]) }
    return max(rob(nums.dropLast(), startIndex: 0), rob(nums, startIndex: 1))
}
func rob(_ nums: [Int], startIndex:Int) -> Int {
    if startIndex >= nums.count { return 0 }
    let key = "\(nums.count)-\(startIndex)"
    if let maxRob = robMap[key] {
        return maxRob
    }
    let maxRob = max(nums[startIndex] + rob(nums,startIndex: startIndex + 2), rob(nums,startIndex: startIndex + 1))
    robMap[key] = maxRob
    return maxRob
}

// 解法2
func rob1(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    guard nums.count > 1 else { return nums[0] }
    guard nums.count > 2 else { return max(nums[0], nums[1]) }
    return max(rob1(nums, isIncludeFirst: false), rob1(nums, isIncludeFirst: true))
}

func rob1(_ nums: [Int], isIncludeFirst:Bool) -> Int {
    let numsCount = nums.count
    let startIndex = isIncludeFirst ? 0 : 1
    let endIndex = isIncludeFirst ? numsCount - 1 : numsCount
    var currentMax = 0
    var perviousMax = 0
    for i in startIndex..<endIndex {
        let tmp = currentMax
        currentMax = max(perviousMax + nums[i], currentMax)
        perviousMax = tmp
    }
    return currentMax
}
