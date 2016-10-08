//
//  ViewController.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 10/3/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let bankName = ["American Express", "BB&T", "Bank of America", "Capital One 360", "Charles Schwab", "Chase", "Citi", "Fidelity", "Navy Federal Credit Union", "PNC", "SunTrust", "TD Bank", "US Bank", "USAA", "Wells Fargo"]
    let typeOfBankName = ["amex", "bbt", "bofa", "capone360", "schwab", "chase", "citi", "fidelity", "nfcu", "pnc", "suntrust", "td", "us", "usaa", "wells"]
    var bankChoose: String = "American Express"
    var typeOfBankChoose: String = "amex"
    
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
        typeOfBankChoose = typeOfBankName[row]
        print("type of the bank: \(typeOfBankChoose)")
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
        
        let input = (userName: input3.text, password: input4.text)
        
        let meg = "The bank you choose is: \(bankChoose) \n The Username is: \(input.userName!) \n"
        let myAlert = UIAlertController(title: "Hello", message: meg, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .Default,
                                     handler:  {
                                        (action:UIAlertAction) -> () in
                                        print("Yes")
                                        self.dismissViewControllerAnimated(true, completion: nil)
            })
        
        let cancelAction = UIAlertAction( title: "No", style: .Default,
                                          handler: {
                                            (action: UIAlertAction) -> () in
                                            print("No")
                                            self.input3.text = ""
                                            self.input4.text = ""
                                            self.dismissViewControllerAnimated(true, completion: nil)
        })
        
        myAlert.addAction(okAction)
        myAlert.addAction(cancelAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

