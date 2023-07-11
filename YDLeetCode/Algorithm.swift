//
//  Algorithm.swift
//  YDLeetCode
//
//  Created by 王远东 on 2023/7/11.
//

import UIKit

class Algorithm: NSObject {
    required override init() {
        // 初始化代码
        print("============")
        print(String(describing: type(of: self)))
        print("============")
    }
    @objc open func runCode() {}
    
    open func getTitle() -> String {
        return ""
    }
    
    open func getDesc() -> String {
        return ""
    }
}
