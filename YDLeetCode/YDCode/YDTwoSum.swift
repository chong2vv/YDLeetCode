//
//  YDTwoSum.swift
//  YDLeetCode
//
//  Created by 王远东 on 2023/7/5.
//

import UIKit

class YDTwoSum: Algorithm {

    override func runCode() {
        super.runCode()
        print(twoSum([2,7,11,15], 9))
    }
    
    // 遍历一次，差值存字典，如果有值就是解
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic:[Int: Int] = [Int: Int]()
        for (index, element) in nums.enumerated() {
            if let numb = dic[element] {
                return [index, numb]
            }else {
                dic[target - element] = index
            }
        }
        return []
    }
    
    override func getTitle() -> String {
        return "两数之和"
    }
    
    override func getDesc() -> String {
        return "给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。你可以按任意顺序返回答案。"
    }
    
}
