//
//  5297-跳跃游戏 III.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/29.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
var canReachSet = Set<Int>()
func canReach(_ arr: [Int], _ start: Int) -> Bool {
    guard start >= 0 && start < arr.count else { return false }
    if canReachSet.contains(start) { return false }
    if arr[start] == 0 { return true }
    canReachSet.insert(start)
    return canReach(arr, start - arr[start]) || canReach(arr, start + arr[start])
}

//func nextPermutation1(_ nums: inout [Int]) -> Bool{
//    for i in stride(from: nums.count - 1, to: 0, by: -1) {
//        if nums[i] > nums[i - 1] {
//            var minThanNum = nums[i]
//            var minThanIndex = i
//            for k in (i+1)..<nums.count {
//                if minThanNum >= nums[k] && nums[k] > nums[i - 1] {
//                    minThanNum = nums[k]
//                    minThanIndex = k
//                }
//            }
//            let tmp = nums[i - 1]
//            nums[i - 1] = nums[minThanIndex]
//            nums[minThanIndex] = tmp
//            let count = nums.count - i
//            let start = i
//            for j in stride(from: start, to: start + count / 2, by: 1) {
//                let tmp = nums[j]
//                nums[j] = nums[count + start + start - j - 1]
//                nums[count + start +  start - j - 1] = tmp
//            }
//            return true
//        }
//    }
//    nums.reverse()
//    return false
//}
//func isSolvable(_ words: [String], _ result: String) -> Bool {
//    var wordsArray = [[CChar]]()
//    for word in words {
//        wordsArray.append(Array(word.utf8CString.dropLast()))
//    }
//    var resultArray = Array(result.utf8CString.dropLast())
//    @discardableResult
//    func isSolvable(_ currentIndex:Int = 0, _ map:[CChar:Int] = [:], _ digit: Int = 0) -> Bool {
//        if currentIndex == resultArray.count {
//            return true
//        }
//        var map = map
//        let currentResultChar = resultArray[resultArray.count - currentIndex - 1]
//        var sum = digit
//        var notAddChars = [CChar:Int]()
//        var equalResultChars = [CChar]()
//        for wordArray in wordsArray {
//            if currentIndex + 1 <= wordArray.count {
//                let tmpChar = wordArray[wordArray.count - currentIndex - 1]
//                if let number = map[tmpChar] {
//                    sum += number
//                }else {
//                    if tmpChar == currentResultChar {
//                        equalResultChars.append(tmpChar)
//                    }else {
//                        notAddChars[tmpChar] = (notAddChars[tmpChar] ?? 0) + 1
//                    }
//                }
//            }
//        }
//        var canUseNumber = Set(0...9)
//        for (_,value) in map {
//            canUseNumber.remove(value)
//        }
//        var resultCanUseNumbers = canUseNumber
//        if let resultNumber = map[currentResultChar]{
//            resultCanUseNumbers = Set([resultNumber])
//        }
//        let tmpSum = sum
//        for j in resultCanUseNumbers {
//            sum = tmpSum
//            sum += equalResultChars.count * j
//            if canUseNumber.count > notAddChars.count {
//                var tmpSet = canUseNumber
//                tmpSet.remove(j)
//                var canUseNumberList = Array(tmpSet).sorted()
//                while true {
//                    var i = 0
//                    var tmpMap = [currentResultChar:j]
//                    for (key, value) in notAddChars {
//                        sum += canUseNumberList[i] * value
//                        i += 1
//                        tmpMap[key] = canUseNumberList[i]
//                    }
//                    if sum % 10 == j {
//                        map.merge(tmpMap) { (origin, _) -> Int in
//                            return origin
//                        }
//                        isSolvable(currentIndex + 1, map, sum / 10)
//                    }
//                    if !nextPermutation1(&canUseNumberList) {
//                        break
//                    }
//                }
//            }
//        }
//        
//        return false
//    }
//    
//    return isSolvable(0)
//}
//
