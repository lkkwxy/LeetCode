//
//  5293-子串的最大出现次数.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/23.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
private class Condition {
    var maxLetters: Int
    var map = [CChar:Int]()
    var array = [CChar]()
    private(set) var key:String = ""
    init(maxLetters: Int, array:[CChar]) {
        self.maxLetters = maxLetters
        self.array = array
        for item in array {
            map[item] = (map[item] ?? 0) + 1
            key += "\(item)_"
        }
    }
    
    func update(_ item:CChar) {
        let removedItem = array.remove(at: 0)
        let index = key.firstIndex(of: "_")!
        key.removeSubrange(...index)
        key += "\(item)_"
        array.append(item)
        map[item] = (map[item] ?? 0) + 1
        if map[removedItem] == 1 {
            map.removeValue(forKey: removedItem)
        }else {
            map[removedItem] = map[removedItem]! - 1
        }
    }
    func isQualified() -> Bool{
        return map.keys.count <= maxLetters
    }
}
func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
    let cs = s.utf8CString
    let count = cs.count - 1
    var slow = 0, fast = minSize - 1
    var resultMap = [String:Int]()
    var maxCount = 0
    let condition = Condition(maxLetters: maxLetters, array: Array(cs[slow...fast]))
    while fast < count {
        if condition.isQualified() {
            let key = condition.key
            let tmp = (resultMap[key] ?? 0) + 1
            maxCount = max(maxCount, tmp)
            resultMap[key] = tmp
        }
        fast += 1
        slow += 1
        condition.update(cs[fast])
    }
    return maxCount
}
