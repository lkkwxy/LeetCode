//
//  6-Z 字形变换.swift
//  LeetCode
//
//  Created by 李坤坤 on 2019/12/17.
//  Copyright © 2019 李坤坤. All rights reserved.
//
/**
将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：

L   C   I   R
E T O E S I I G
E   D   H   N
之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

请你实现这个将字符串进行指定行数变换的函数：

string convert(string s, int numRows);
示例 1:

输入: s = "LEETCODEISHIRING", numRows = 3
输出: "LCIRETOESIIGEDHN"
示例 2:

输入: s = "LEETCODEISHIRING", numRows = 4
输出: "LDREOEIIECIHNTSG"
解释:

L     D     R
E   O E   I I
E C   I H   N
T     S     G

*/
import Foundation
func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 else { return s }
    var rows = Array(repeating: "", count: numRows)
    var flag = -1
    var row = 0
    for value in s {
        rows[row] = rows[row] + String(value)
        if row == 0 || row == numRows - 1 {
            flag = -flag
        }
        row += flag
    }
    return rows.reduce("", { $0 + $1})
}
