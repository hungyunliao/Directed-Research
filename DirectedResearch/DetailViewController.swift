//
//  DetailViewController.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 10/12/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textRegion: UILabel!
    
    var toPass:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textRegion.text = toPass
        
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
