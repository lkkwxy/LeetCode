//
//  main.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/9.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation

func squareNumberCount(_ nums:[Int]) -> Int {
    var count = 0
    var left = 0
    var right = nums.count - 1
    while left <= right {
        let tmpLeft = nums[left]
        let tmpRight = nums[right]
        var isAddLeft = false
        var isSubtractRight = false
        if abs(tmpLeft) == abs(tmpRight) {
            isAddLeft = true
            isSubtractRight = true
        }else if abs(tmpLeft) < abs(tmpRight) {
            isSubtractRight = true
        }else {
            isAddLeft = true
        }
        if isAddLeft {
            left += 1
            while tmpLeft == nums[left] && left < right {
                left += 1
            }
        }
        
        if isSubtractRight {
            right -= 1
            while tmpRight == nums[right] && left < right {
                right -= 1
            }
        }
        count += 1
    }
    return count
}
print(squareNumberCount([-4,-2,-1,-1,0,0,2,3,5]))
//测试 35. 搜索插入位置
searchInsert([1,3,5,6], 7)
//测试31-下一个排列
var nums = [2,3,1,3,3]
nextPermutation(&nums)
assert(nums == [2,3,3,1,3])

//测试621-任务调度器
assert(leastInterval(["A","A","A","B","B","B"],2) == 8)

//测试89-格雷编码
print(grayCode(2))


// 测试1169-查询无效交易
print(invalidTransactions(["bob,689,1910,barcelona","alex,696,122,bangkok","bob,832,1726,barcelona","bob,820,596,bangkok","chalicefy,217,669,barcelona","bob,175,221,amsterdam"]))

// 测试 796-旋转字符串
assert(rotateString("abcde", "cdeab"))

// 测试 682-棒球比赛.swift
assert(calPoints(["5","2","C","D","+"]) == 30)

// 测试 205-同构字符串
assert(isIsomorphic("egg","add"))

// 测试 665-非递减数列
assert(checkPossibility([4,1,2,3]))
assert(checkPossibility1([4,1,2,3]))

// 测试4-寻找两个有序数组的中位数
assert(findMedianSortedArrays([1,3], [2,4]) == 2.5)
// 6-Z 字形变换
assert(convert("LEETCODEISHIRING", 3) == "LCIRETOESIIGEDHN")
// 测试 309-最佳买卖股票时机含冷冻期
assert(maxProfit([1,2,3,0,2]) == 3)

// 测试 303-区域和检索-数组不可变
let numsArray = NumArray([1,2,3,4,5])
assert(numsArray.sumRange(0, 2) == 6)

// 测试977-有序数组的平方
assert(sortedSquares([-4,-2,0,3,10]) == [0,4,9,16,100])

// 测试 322-零钱兑换
assert(coinChange([284,260,393,494],7066) == 17)

// 测试 486-预测赢家
assert(PredictTheWinner([1, 5, 233, 7]))

// 测试 1104-二叉树寻路
assert(pathInZigZagTree(14) == [1,3,4,14])

// 测试 84-柱状图中最大的矩形
print(largestRectangleArea([5,4,1,2]))
// 测试 42-接雨水
print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
