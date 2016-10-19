//
//  DetailViewController.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 10/12/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import UIKit
import JavaScriptCore

class DetailViewController: UIViewController {

    @IBOutlet weak var textRegion: UILabel!
    
    var toPass:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textRegion.text = toPass
        
        // get a reference to the d3 library in our project
        let fileLocation = Bundle.main.path(forResource: "d3.min", ofType: "js")!
        // convert it to a string
        let jsSource: String = try! String(contentsOfFile: fileLocation)
        // create a javascript context environment
        let context = JSContext()
        // add exception handler so we can see any error that occur in our javascript
        context?.exceptionHandler = { context, exception in
            print("JS Error: \(exception)")
        }
        // load in the javascript into our context
        context?.evaluateScript(jsSource)
        
        let jsStr = "var testValue = 3"
        
        // create our javascript function for the linear scale we also mix in swift with the maxAmount variale
        // context.evaluateScript("circles = d3.scale.quantize().domain([0,\(30000)]).range([3, 2, 1])")
        context?.evaluateScript(jsStr)
        let strr: JSValue = context!.evaluateScript("testValue")
        textRegion.text = String(Int(strr.toInt32()))
        
//        // loop through all the contacts to determine which circle they should be placed in
//        for contact in contacts {
//            // get the circle number based on score it will return 1, 2 or 3
//            let circle: JSValue = context.evaluateScript("radius_circles(\(contact.score))");
//            //  cast the JSValue to Int
//            contact.circle = Int(circle.toInt32())
//        }
//        // sort the contacts array based on the new circle value
//        self.contacts.sortInPlace({ $0.circle < $1.circle })
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
