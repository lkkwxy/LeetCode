//
//  48. 旋转图像.swift
//  LeetCode
//
//  Created by 李坤 on 2020/12/19.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func rotate(_ matrix: inout [[Int]]) {
   let n = matrix.count
   if n <= 1 {
       return
   }
   let ring = (n + 1) / 2
   for i in 0..<ring {
       let start = i
       let end = n - i - 1
       for j in start..<end {
           let tmp = matrix[i][j]
           matrix[i][j] = matrix[end - j + i][i]
           matrix[end - j + i][i] = matrix[end][end - j + i]
           matrix[end][end - j + i] = matrix[j][end]
           matrix[j][end] = tmp
       }
   }
}
