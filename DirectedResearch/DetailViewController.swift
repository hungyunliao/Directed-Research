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
    
    
    @IBAction func showLocation(_ sender: AnyObject) {
        let data: [Double] = [30, 20, 10, 30, 10]
        let labels = ["NY", "SF", "LA", "SD", "SB", "R"]
        
        dataVisualization(data: data, labels: labels, showBar: true)
    }
    
    @IBAction func showCategory(_ sender: AnyObject) {
        let data: [Double] = [10, 30, 30, 10, 10]
        let labels = ["Food", "Restaurant", "Bookstore", "Car", "Drink", "Acc"]
        
        dataVisualization(data: data, labels: labels, showBar: false)
    }
    
    
    @IBOutlet weak var dataVis: UIView!
    var toPass:Data!
    
    private func dataVisualization(data: [Double], labels: [String], showBar: Bool) {
        let graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.9, height: self.view.frame.height/2))
                graphView.set(data: data, withLabels: labels);
        graphView.shouldDrawBarLayer = showBar
        graphView.shouldDrawDataPoint = !showBar
        if showBar {
            graphView.lineColor = UIColor.clear
        } else {
            graphView.lineColor = UIColor.black
        }
        dataVis.addSubview(graphView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textRegion.text = toPass
        if let parsedData = try? JSONSerialization.jsonObject(with: toPass) as! [String:Any] {
            
            let transaction = parsedData["transactions"] as! [[String:Any]]
            print("transactions")
            print(transaction[0]["date"]!)
        }
        
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
