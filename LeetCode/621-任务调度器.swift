//
//  621-任务调度器.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/10.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var tasksMap = [Character:Int]()
    for task in tasks {
        tasksMap[task] = (tasksMap[task] ?? 0) + 1
    }
    var taskMaxCount = 0
    var sameCountNum = 0
    for (_,count) in tasksMap {
        if count > taskMaxCount {
            sameCountNum = 1
            taskMaxCount = count
        }else if count == taskMaxCount {
            sameCountNum += 1
        }
    }
    let minTime = (taskMaxCount - 1) * (n + 1) + sameCountNum
    return max(minTime, tasks.count)
//    下面使用数组实现的
//    var taskCounts = Array(repeating: 0, count: 26)
//    for task in tasks {
//       let index = Int(task.asciiValue! - 65)
//       taskCounts[index] += 1
//    }
//    var taskMaxCount = 0
//    var sameCountNum = 0
//    for count in taskCounts {
//       if count > taskMaxCount {
//           sameCountNum = 1
//           taskMaxCount = count
//       }else if count == taskMaxCount {
//           sameCountNum += 1
//       }
//    }
//    let minTime = (taskMaxCount - 1) * (n + 1) + sameCountNum
//    return max(minTime, tasks.count)
}
