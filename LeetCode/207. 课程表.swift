//
//  207. 课程表.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/10.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var res = [Int: Bool]()
    var dependInfos = [Int: [Int]]()
    for item in prerequisites {
        var tmpArray = dependInfos[item[0]] ?? [Int]()
        tmpArray.append(item[1])
        dependInfos[item[0]] = tmpArray
    }
    for (key, value) in dependInfos {
        if !isCanLearn(course: key, depends: value, prerequisites: dependInfos, res: &res) {
            return false
        }
    }
    return true
}

func isCanLearn(course: Int, depends: [Int], prerequisites: [Int: [Int]], res: inout [Int: Bool]) -> Bool {
    if depends.count == 0 {
        res[course] = true
        return true
    }
    res[course] = false
    for item in depends {
        let depend = prerequisites[item]
        let isLearn = res[item]
        if isLearn == false {
            return false
        }else  if isLearn == nil, let depend = depend, isCanLearn(course: item, depends: depend, prerequisites: prerequisites, res: &res) == false {
            return false
        }
    }
    res[course] = true
    return true
}
