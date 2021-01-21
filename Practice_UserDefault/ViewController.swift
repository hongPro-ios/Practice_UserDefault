//
//  ViewController.swift
//  Practice_UserDefault
//
//  Created by JEONGSEOB HONG on 2021/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        // Do any additional setup after loading the view.
        
        
        
    }
    @IBAction func updateUserDefault(_ sender: Any) {
        UDM.shared.defaults.setValue(field.text, forKey: "name")
        label.text = UDM.shared.getName()
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // name: Hong
        UDM.shared.defaults.setValue(field.text, forKey: "name")
        field.resignFirstResponder()
        
        return true
    }
    
}

class UDM {
    
    static let shared = UDM()
    
    let defaults = UserDefaults(suiteName: "com.test.saved.data")!
    
    // Other funcs
    func getName() -> String {
        guard let value = UDM.shared.defaults.value(forKey: "name") as? String else {
            return "name is not exist"
        }
            return value
    
        }
    }
