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

class Person: Hashable {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        print("lhs === rhs")
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

maxNumEdgesToRemove(4,[[3,1,2],[3,2,3],[1,1,3],[1,2,4],[1,1,2],[2,3,4]])
