//
//  ViewController.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 10/3/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: instance variables
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    @IBOutlet weak var picker1: UIPickerView!
    
    // MARK: model
    var login : LoginModel = LoginModel()
    
    
    // MARK: pickerview delegate
    let bankName = ["American Express", "BB&T", "Bank of America", "Capital One 360", "Charles Schwab", "Chase", "Citi", "Fidelity", "Navy Federal Credit Union", "PNC", "SunTrust", "TD Bank", "US Bank", "USAA", "Wells Fargo"]
    let typeOfBankName = ["amex", "bbt", "bofa", "capone360", "schwab", "chase", "citi", "fidelity", "nfcu", "pnc", "suntrust", "td", "us", "usaa", "wells"]
    var bankChoose: String = "American Express"
    var typeOfBankChoose: String = "amex"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == picker1 {
            return bankName.count
        } else {
            return bankName.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = bankName[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.white])
        if pickerView == picker1 { return myTitle }
        else { return myTitle }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bankChoose = bankName[row]
        typeOfBankChoose = typeOfBankName[row]
        print("type of the bank: \(typeOfBankChoose)")
    }
    
    
    // MARK: overide functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        picker1.delegate = self
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        login.updateInfo(username: input3.text!, password: input4.text!, bankName: bankChoose)
        
        if login.inputValidation() {
            //showConfirmationAlert()
            return true
        } else {
            showInvalidAlert()
            return false
        }
    }
    
    override func prepare(for segue: (UIStoryboardSegue!), sender: Any!) {
        if (segue.identifier == "test") {
            let svc = segue!.destination as! DetailViewController
            svc.account = input3.text
            svc.psw = input4.text
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: functions
    func showConfirmationAlert() {
        // Input info confirmation
        let meg = "The bank you choose is: \(bankChoose) \n The Username is: \(input3.text!) \n"
        let myAlert = UIAlertController(title: "Hello", message: meg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .default,
                                     handler:  {
                                        (action:UIAlertAction) -> () in
                                        print("Yes")
                                        self.dismiss(animated: true, completion: nil)
        })
        
        let cancelAction = UIAlertAction(title: "No", style: .default,
                                         handler: {
                                            (action: UIAlertAction) -> () in
                                            print("No")
                                            self.input3.text = ""
                                            self.input4.text = ""
                                            self.dismiss(animated: true, completion: nil)
        })
        
        myAlert.addAction(okAction)
        myAlert.addAction(cancelAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func showInvalidAlert() {
        // Input info confirmation
        let meg = "Please check account/password again! \n"
        let myAlert = UIAlertController(title: "Invalid Input!", message: meg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default,
                                     handler:  {
                                        (action:UIAlertAction) -> () in
                                        self.dismiss(animated: true, completion: nil)
        })
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
}


