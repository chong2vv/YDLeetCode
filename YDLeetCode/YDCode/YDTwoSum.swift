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
        print(twoSum([0,4,3,0], 0))
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for i in (0..<nums.count).reversed() {
            print(i)
            print(nums[i])
        }
        
        var result: [Int] = [Int]()
        if nums.count == 1 {
            return result
        }
        
        if nums.count == 2 {
            if nums[0] + nums[1] == target {
                result.append(0)
                result.append(1)
                return result
            }
        }
        
        for i in (0...nums.count - 2) {
            for j in (i+1...nums.count - 1) {
                if nums[i] + nums[j] == target {
                    result.append(i)
                    result.append(j)
                    return result
                }
                
            }
        }
        return result
    }
    
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = [Int]()
        if nums.count == 1 {
            return result
        }
        
        if nums.count == 2 {
            if nums[0] + nums[1] == target {
                result.append(0)
                result.append(1)
                return result
            }
        }
        
        for i in (0...nums.count - 2) {
            for j in (i+1...nums.count - 1) {
                if nums[i] + nums[j] == target {
                    result.append(i)
                    result.append(j)
                    return result
                }
                
            }
        }
        return result
    }
    
    override func getTitle() -> String {
        return "两数之和"
    }
    
    override func getDesc() -> String {
        return "给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。你可以按任意顺序返回答案。"
    }
    
}
