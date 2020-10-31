//
//  381. O(1) 时间插入、删除和获取随机元素 - 允许重复.swift
//  LeetCode
//
//  Created by 李坤坤 on 2020/10/31.
//  Copyright © 2020 李坤坤. All rights reserved.
//

import Foundation
/**
 设计一个支持在平均 时间复杂度 O(1) 下， 执行以下操作的数据结构。

 注意: 允许出现重复元素。

 insert(val)：向集合中插入元素 val。
 remove(val)：当 val 存在时，从集合中移除一个 val。
 getRandom：从现有集合中随机获取一个元素。每个元素被返回的概率应该与其在集合中的数量呈线性相关。
 示例:

 // 初始化一个空的集合。
 RandomizedCollection collection = new RandomizedCollection();

 // 向集合中插入 1 。返回 true 表示集合不包含 1 。
 collection.insert(1);

 // 向集合中插入另一个 1 。返回 false 表示集合包含 1 。集合现在包含 [1,1] 。
 collection.insert(1);

 // 向集合中插入 2 ，返回 true 。集合现在包含 [1,1,2] 。
 collection.insert(2);

 // getRandom 应当有 2/3 的概率返回 1 ，1/3 的概率返回 2 。
 collection.getRandom();

 // 从集合中删除 1 ，返回 true 。集合现在包含 [1,2] 。
 collection.remove(1);

 // getRandom 应有相同概率返回 1 和 2 。
 collection.getRandom();

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/insert-delete-getrandom-o1-duplicates-allowed
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class RandomizedCollection {
    private var array = [Int]()
    private var map = [Int: Set<Int>]()
    private var count = 0
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the collection. Returns true if the collection did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        var isContain = false
        if var set = map[val] {
            isContain = true
            set.insert(count)
            map[val] = set
        } else {
            map[val] = [count]
        }
        if array.count > count {
            array[count] = val
        } else {
            array.append(val)
        }
        count += 1
        return !isContain
    }
    
    /** Removes a value from the collection. Returns true if the collection contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if var set = map[val], set.count > 0, let index = set.randomElement()  {
            set.remove(index)
            map[val] = set
            if index != count - 1 {
                array[index] = array[count - 1]
                set = map[array[count - 1]]!
                set.remove(count - 1)
                set.insert(index)
                map[array[count - 1]] = set
            }
            count -= 1
            return true
        }
        return false
    }
    
    /** Get a random element from the collection. */
    func getRandom() -> Int {
        guard count > 0 else {
            return -1
        }
        let random = Int.random(in: 0..<count)
        return array[random]
    }
}

func test() {
    let collection = RandomizedCollection()
    print(collection.insert(0))
    
    print(collection.remove(0))
    print(collection.insert(-1))
//    print(collection.insert(2))
    print(collection.remove(0))
    print(collection.getRandom())
}
