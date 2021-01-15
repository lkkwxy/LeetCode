//
//  1202. 交换字符串中的元素.swift
//  LeetCode
//
//  Created by 李坤 on 2021/1/11.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
    var charArray = s.unicodeScalars.map { $0.value }
    var setArray = [Set<Int>]()
    for pair in pairs {
        var tmpArray = [Set<Int>]()
        var curSet: Set<Int>?
        for set in setArray {
            if set.contains(pair[0]) || set.contains(pair[1]) {
                if curSet == nil {
                    curSet = set
                }
                curSet?.formUnion(set)
                curSet?.insert(pair[0])
                curSet?.insert(pair[1])
            } else {
                tmpArray.append(set)
            }
        }
        if let curSet = curSet {
            tmpArray.append(curSet)
            setArray = tmpArray
        } else {
            setArray.append([pair[0], pair[1]])
        }
    }
    let indexArray = setArray.map {  Array($0).sorted()}
    let sortCharArray = indexArray.map { $0.map { charArray[$0]}.sorted() }
    for i in 0..<indexArray.count {
        for j in 0..<indexArray[i].count {
            charArray[indexArray[i][j]] = sortCharArray[i][j]
        }
    }
  
    let res = charArray.reduce("") { $0 +  String(UnicodeScalar($1)!)}
    return res
}
