//
//  977-有序数组的平方.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/19.
//  Copyright © 2019 李坤坤. All rights reserved.
//

import Foundation
// 解法1
func sortedSquares(_ A: [Int]) -> [Int] {
    func abs(_ num: Int) -> Int {
        return num > 0 ? num : -num
    }
    var squares = [Int]()
    var i = 0
    var j = A.count - 1
    while i <= j {
        let positiveI = abs(A[i])
        let positiveJ = abs(A[j])
        if positiveI > positiveJ {
            squares.append(positiveI * positiveI)
            i += 1
        }else {
            squares.append(positiveJ * positiveJ)
            j -= 1
        }
    }
    return squares.reversed()
}
// 解法2
func sortedSquares1(_ A: [Int]) -> [Int] {
    var positiveSquares = [Int]()
    var negativeSquares = [Int]()
    var squares = [Int]()
    A.forEach { (item) in
        if item < 0 {
            negativeSquares.append(item * item)
        }else {
            positiveSquares.append(item * item)
        }
    }
    var i = 0
    var j = negativeSquares.count - 1
    while i < positiveSquares.count && j >= 0 {
        if positiveSquares[i] > negativeSquares[j] {
            squares.append(negativeSquares[j])
            j -= 1
        }else {
            squares.append(positiveSquares[i])
            i += 1
        }
    }
    if j < 0 {
        squares.append(contentsOf: positiveSquares[i..<positiveSquares.count])
    }else {
        squares.append(contentsOf: negativeSquares[0...j].reversed())
    }
    return squares
}
