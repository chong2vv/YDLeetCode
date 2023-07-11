//
//  NextViewController.swift
//  YDLeetCode
//
//  Created by 王远东 on 2023/7/9.
//

import UIKit

class NextViewController: UIViewController {

    private var className:String?
    private var instance:Algorithm?
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var runButton: UIButton!
    
    static func loadFromNib(className: String?) -> NextViewController? {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController
        vc?.className = className
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = self.className {
            if let instance = createInstance(className: name) {
                self.instance = instance
                self.titleLabel.text = instance.getTitle()
                self.descLabel.text = instance.getDesc()
            }
        }
        
    }
    
    func createInstance(className: String) -> Algorithm? {
        if let classType = NSClassFromString(className) as? Algorithm.Type {
            return classType.init()
        }
        return nil
    }

    @IBAction func runCode(_ sender: Any) {
        if let instance = instance {
            instance.runCode()
        }
    }
}
