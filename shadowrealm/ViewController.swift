//
//  ViewController.swift
//  shadowrealm
//
//  Created by jay★ on 2016-06-28.
//  Copyright © 2016 jay★. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var player1hp: UILabel!
    @IBOutlet weak var player1count: UITextField!
    
    @IBOutlet weak var player2hp: UILabel!
    @IBOutlet weak var player2count: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        let titleLabel1 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        titleLabel1.text = "Take damage or heal"
        titleLabel1.backgroundColor = UIColor.clear
        titleLabel1.textAlignment = NSTextAlignment.center
        titleLabel1.sizeToFit()
        let title1 = UIBarButtonItem(customView: titleLabel1)
        
        let titleLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        titleLabel2.text = "Take damage or heal"
        titleLabel2.backgroundColor = UIColor.clear
        titleLabel2.textAlignment = NSTextAlignment.center
        titleLabel2.sizeToFit()
        let title2 = UIBarButtonItem(customView: titleLabel2)
        
        let flex = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let toolbar1 = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        toolbar1.barStyle = UIBarStyle.default
        toolbar1.isTranslucent = false
        toolbar1.clipsToBounds = true
        toolbar1.layer.borderWidth = 1
        toolbar1.layer.borderColor = UIColor.blue.cgColor
        toolbar1.setItems([flex, title1, flex], animated: false)
        player1count.inputAccessoryView = toolbar1
        
        let toolbar2 = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        toolbar2.barStyle = UIBarStyle.default
        toolbar2.isTranslucent = false
        toolbar2.clipsToBounds = true
        toolbar2.layer.borderWidth = 1
        toolbar2.layer.borderColor = UIColor.orange.cgColor
        toolbar2.setItems([flex, title2, flex], animated: false)
        player2count.inputAccessoryView = toolbar2
        
        player1count.delegate = self
        player2count.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == player1count {
            player2count.text = ""
            return
        }
        
        if textField == player2count {
            player1count.text = ""
            return
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == player1count {
            player1count.text = ""
            return
        }
        
        if textField == player2count {
            player2count.text = ""
            return
        }
    }
    
    @IBAction func player1add(_ sender: AnyObject) {
        let newvalue = (player1hp.text! as NSString).intValue + (player1count.text! as NSString).intValue
        player1hp.text = "\(newvalue)"
        dismissKeyboard()
    }
    
    @IBAction func player1minus(_ sender: AnyObject) {
        let newvalue = (player1hp.text! as NSString).intValue - (player1count.text! as NSString).intValue
        player1hp.text = "\(newvalue)"
        dismissKeyboard()
    }
    
    @IBAction func player2add(_ sender: AnyObject) {
        let newvalue = (player2hp.text! as NSString).intValue + (player2count.text! as NSString).intValue
        player2hp.text = "\(newvalue)"
        dismissKeyboard()
    }
    
    @IBAction func player2minus(_ sender: AnyObject) {
        let newvalue = (player2hp.text! as NSString).intValue - (player2count.text! as NSString).intValue
        player2hp.text = "\(newvalue)"
        dismissKeyboard()
    }
    
    @IBAction func getrekt(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Reset game?", message:"Get rekt and sent to the Shadow Realm", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.player1hp.text = "8000"
            self.player2hp.text = "8000"
            self.dismissKeyboard()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(action)
        self.present(alert, animated: true){}
    }
    
}

