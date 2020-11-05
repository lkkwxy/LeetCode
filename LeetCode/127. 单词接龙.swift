//
//  127. 单词接龙.swift
//  LeetCode
//
//  Created by 李坤 on 2020/11/5.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
/**
 给定两个单词（beginWord 和 endWord）和一个字典，找到从 beginWord 到 endWord 的最短转换序列的长度。转换需遵循如下规则：

 每次转换只能改变一个字母。
 转换过程中的中间单词必须是字典中的单词。
 说明:

 如果不存在这样的转换序列，返回 0。
 所有单词具有相同的长度。
 所有单词只由小写字母组成。
 字典中不存在重复的单词。
 你可以假设 beginWord 和 endWord 是非空的，且二者不相同。
 示例 1:

 输入:
 beginWord = "hit",
 endWord = "cog",
 wordList = ["hot","dot","dog","lot","log","cog"]

 输出: 5

 解释: 一个最短转换序列是 "hit" -> "hot" -> "dot" -> "dog" -> "cog",
      返回它的长度 5。
 示例 2:

 输入:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log"]

 输出: 0

 解释: endWord "cog" 不在字典中，所以无法进行转换。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-ladder
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    if beginWord == endWord {
        return 0
    }
    var map = [String : [String]]()
    let handleWord = { (word: String) in
        var array = [String]()
        let count = word.count
        var index = word.startIndex
        for _ in 0..<count {
            let range = index...index
            let tmp = word.replacingCharacters(in: range, with: "*")
            array.append(tmp)
            index = word.index(after: index)
        }
        map[word] = array
        for item in array {
            var tmp = map[item] ?? []
            tmp.append(word)
            map[item] = tmp
        }
    }
    
    for word in wordList {
       handleWord(word)
    }
    if !map.keys.contains(endWord) {
        return 0
    }
    
    if !map.keys.contains(beginWord) {
        handleWord(beginWord)
    }
    var length = 0
    var isLooked = false
    var checkedSet = Set<String>()
    var unCheckedWordList = map[beginWord]!
    checkedSet.insert(beginWord)
    while !unCheckedWordList.isEmpty {
        var tmpArray = [String]()
        for word in unCheckedWordList {
            if word == endWord {
                isLooked = true
                break
            }
            if !checkedSet.contains(word) {
                tmpArray.append(contentsOf: map[word] ?? [])
                checkedSet.insert(word)
            }
        }
        unCheckedWordList = tmpArray
        length += 1
        if isLooked {
            break
        }
    }
    return isLooked ? length / 2 + 1 : 0
}
