//
//  ViewController.swift
//  Client App
//
//  Created by Karthik Datta on 03/04/24.
//

import UIKit
import SDK_Assignment

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func resetUserProps(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)
        
        ExampleSDK.shared?.resetUserProperties()
    }
    
    @IBAction func resetUserIDs(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)
        
        ExampleSDK.shared?.resetUserIdentities()
    }
    
    @IBAction func setUserProperties(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)

        ExampleSDK.shared?.setUserProperties(properties: ["user_name": "John", "age": 24, "gender":"male"])
    }
    
    @IBAction func setUserProperties2(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)

        ExampleSDK.shared?.setUserProperties(properties: ["user_name2": "Vishnu", "age": 26])
    }
    
    @IBAction func sendEventWithProp(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)

        ExampleSDK.shared?.sendEvent(name: "Send Custom Event", properties: ["prop1": "val1", "prop2": "val2"])
    }
    
    @IBAction func sendEvent(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)

        ExampleSDK.shared?.sendEvent(name: "Send Custom Event Only")
    }
    
    @IBAction func setUserIdentities1(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)

        ExampleSDK.shared?.setUserIdentities(identities: ["user_id": 1234, "login_id": "dkd11"])

    }

    @IBAction func setUserIdentities2(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)

        ExampleSDK.shared?.setUserIdentities(identities: ["user_id": 5678, "login_id": "vj12", "input_id":"420"])
    }

    @IBAction func setUserLogout(sender: UIButton) {
//        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//        present(alertController, animated: true, completion: nil)

        ExampleSDK.shared?.logOut()
    }
}


