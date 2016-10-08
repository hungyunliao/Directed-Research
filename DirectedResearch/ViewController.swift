//
//  ViewController.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 10/3/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let bankName = ["BoA", "Chase", "Citi", "HSBC"]
    var bankChoose: String = "BoA"
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bankName.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bankName[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bankChoose = bankName[row]
        print("name of the bank: \(bankName[row])")
    }
    

    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func submit(sender: UIButton) {
        
        let input = ( userName: input3.text, password: input4.text)
        
        let meg = "The bank you choose is: \(bankChoose) \n The Username is: \(input.userName!) \n"
        let myAlert = UIAlertController(title: "Hello", message: meg, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default,
                                     handler:  {
                                        (action:UIAlertAction) -> () in
                                        print("Ok")
                                        self.dismissViewControllerAnimated(true, completion: nil)
            })
        
//        let cancelAction = UIAlertAction( title: "So So", style: .Default,
//                                          handler: {
//                                            (action: UIAlertAction) -> () in
//                                            print("so so")
//                                            self.dismissViewControllerAnimated(true, completion: nil)
//        })
        
        myAlert.addAction(okAction)
        //myAlert.addAction(cancelAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

