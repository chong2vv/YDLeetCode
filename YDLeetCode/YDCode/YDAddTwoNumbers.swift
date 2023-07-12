//
//  YDAddTwoNumbers.swift
//  YDLeetCode
//
//  Created by 王远东 on 2023/7/6.
//

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class YDAddTwoNumbers: Algorithm {
    
    override func runCode() {
        super.runCode()
        addTwoNumbers(ListNode(2, ListNode(4, ListNode(9))), ListNode(5, ListNode(6, ListNode(4, ListNode(9)))))
//        addTwoNumbers(ListNode(0), ListNode(0))
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var temp = l1
        var num = String(temp?.val ?? 0)
        while temp?.next != nil  {
            num = num + "\(temp?.next?.val ?? 0)"
            temp = temp?.next
        }
        
        var temp2 = l2
        var num2:String = String(temp2?.val ?? 0)
        while temp2?.next != nil  {
            num2 = num2 + "\(temp2?.next?.val ?? 0)"
            temp2 = temp2?.next
        }
        
//        var num3 = ""
//        var nextVale = 0
//        while temp?.next != nil || temp2?.next != nil {
//            if temp.
//        }
        
        var val:String = ""
//        var val:String = "\((Int(num) ?? 0) + (Int(num2) ?? 0))"
//        while val.last == "0" {
//            val.removeLast()
//        }
        let lastNum = String(val[val.startIndex])
        var lastNode = ListNode(Int(lastNum) ?? 0)
        if val.count > 1 {
            val.removeFirst()
            for (_, item) in String(val).enumerated() {
                lastNode = ListNode(Int(String(item)) ?? 0, lastNode)
            }
            return lastNode
            
        }else {
            return lastNode
        }
      
    }
    
    override func getTitle() -> String {
        return "两数相加"
    }
    
    override func getDesc() -> String {
        return "给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。请你将两个数相加，并以相同形式返回一个表示和的链表。你可以假设除了数字 0 之外，这两个数都不会以 0 开头。"
    }
    
}
