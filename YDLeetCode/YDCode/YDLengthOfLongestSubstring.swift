//
//  YDLengthOfLongestSubstring.swift
//  YDLeetCode
//
//  Created by 王远东 on 2023/7/31.
//

import UIKit

class YDLengthOfLongestSubstring: Algorithm {
    override func runCode() {
        super.runCode()
        print(lengthOfLongestSubstring("pwwkew"))
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var tempStr = ""
        var lastStr = ""
        for str in s {
            if tempStr.contains(str) {
                if lastStr.count < tempStr.count {
                    lastStr = tempStr
                }
                var subIndex = 0
                for (index, element) in tempStr.enumerated() {
                    if element == str {
                        subIndex = index
                        break
                    }
                }
                print(subIndex)
                if subIndex == 0 {
                    tempStr.remove(at: tempStr.startIndex)
                } else {
                    let indexToRemoveUpTo = tempStr.index(tempStr.startIndex, offsetBy: subIndex)
                    tempStr.removeSubrange(tempStr.startIndex..<indexToRemoveUpTo)
                }
                print(tempStr)
                tempStr.append(str)
            }else {
                tempStr.append(str)
            }
        }
        
        if lastStr.count < tempStr.count {
            lastStr = tempStr
        }
        return lastStr.count
    }
    
    override func getTitle() -> String {
        return "无重复字符的最长子串"
    }
    
    override func getDesc() -> String {
        return "给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。"
    }
}
