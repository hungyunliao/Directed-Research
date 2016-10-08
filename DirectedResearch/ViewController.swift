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
        print("name of the bank: \(bankName[row])")
    }
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func submit(sender: UIButton) {
        let input = (one: input1.text, two: input2.text, three: input3.text, four: input4.text)
        label1.text = input.one
        label2.text = input.two
        label3.text = input.three
        label4.text = input.four
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

