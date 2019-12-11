//
//  main.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/9.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation

print("Hello, World!")
//测试31-下一个排列
var nums = [2,3,1,3,3]
nextPermutation(&nums)
print(nums == [2,3,3,1,3])

//测试621-任务调度器
print(leastInterval(["A","A","A","B","B","B"],2))

//测试89-格雷编码
print(grayCode(2))

