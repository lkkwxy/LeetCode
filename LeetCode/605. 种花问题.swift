//
//  605. 种花问题.swift
//  LeetCode
//
//  Created by 李坤坤 on 2021/1/1.
//  Copyright © 2021 李坤坤. All rights reserved.
//

import Foundation
func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var count = n
    var perviousPlace = flowerbed[0] == 0
    var i = 0
    let lastIndex = flowerbed.count - 1
    while i < flowerbed.count {
        let currentPlace = flowerbed[i] == 0
        let nextPlace = i == lastIndex || flowerbed[i + 1] == 0
        if perviousPlace && currentPlace && nextPlace {
            count -= 1
            perviousPlace = true
            i += 2
        } else {
            perviousPlace = currentPlace
            i += 1
        }
    }
    return count <= 0
}
