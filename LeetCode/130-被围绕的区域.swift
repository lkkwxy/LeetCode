//
//  130-被围绕的区域.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/1/1.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
func solve(_ board: inout [[Character]]) {
    let m = board.count
    guard m > 2, let n = board.first?.count, n > 2 else { return }
    typealias Point = (x:Int,y:Int)
    var points = [Point]()
    for i in 0..<n {
        if board[0][i] == "O" {
            points.append((0,i))
        }
        if board[m-1][i] == "O" {
            points.append((m - 1,i))
        }
    }
    for i in 0..<m {
        if board[i][0] == "O" {
            points.append((i,0))
        }
        if board[i][ n - 1] == "O" {
            points.append((i,n - 1))
        }
    }
    while points.count > 0 {
        let (x,y) = points.removeLast()
        board[x][y] = "Y"
        if x + 1 < m && board[x + 1][y] == "O" {
            points.append((x + 1,y))
        }
        if x - 1 >= 0 && board[x - 1][y] == "O" {
            points.append((x - 1,y))
        }
        if y + 1 < n && board[x][y + 1] == "O" {
            points.append((x,y + 1))
        }
        if y - 1 >= 0 && board[x][y - 1] == "O" {
            points.append((x,y - 1))
        }
    }
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] == "O" {
                board[i][j] = "X"
            }else if board[i][j] == "Y" {
                board[i][j] = "O"
            }
        }
    }
}
