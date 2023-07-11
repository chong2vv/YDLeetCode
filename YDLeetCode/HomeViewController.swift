//
//  HomeViewController.swift
//  YDLeetCode
//
//  Created by 王远东 on 2023/7/10.
//

import UIKit

class HomeViewController: UITableViewController {
    
    @IBOutlet var homeTableView: UITableView!
    var classList:[String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        classList = getAllCustomClassNames()
        homeTableView.reloadData()
    }
    
    func getAllCustomClassNames() -> [String] {
        var classNames = [String]()

        // 获取当前程序集中的所有类
        let expectedClassCount = objc_getClassList(nil, 0)
        let allClasses = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(expectedClassCount))
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
        let actualClassCount = objc_getClassList(autoreleasingAllClasses, expectedClassCount)

        // 遍历所有类
        for i in 0..<actualClassCount {
            let currentClass: AnyClass = allClasses[Int(i)]
            let className = NSStringFromClass(currentClass)
            if className.hasPrefix("YD") {
               if class_getSuperclass(currentClass) != nil,
                  class_getInstanceSize(currentClass) > 0 {
                   if className.contains(".") {
                      let list = className.components(separatedBy: ".")
                       if let name = list.last, name.hasPrefix("YD") {
                           classNames.append(className)
                       }
                   }
               }
            }
        }

        allClasses.deallocate()

        return classNames
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath)
        let name = classList[indexPath.row]
        if name.contains(".") {
           let list = name.components(separatedBy: ".")
            if let subName = list.last, name.hasPrefix("YD") {
                cell.textLabel?.text = subName
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let className = classList[indexPath.row]
        if let vc = NextViewController.loadFromNib(className: className) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
