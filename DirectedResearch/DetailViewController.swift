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
        textRegion.text = "This is your statistics for the Locations that you made the purchase."
        if let json = try? JSONSerialization.jsonObject(with: toPass) as! [String:Any] {
            
            let transaction = json["transactions"] as! [[String:Any]]
            print("transactions")
            print(transaction[0]["date"]!)
            
            let data: [Double] = [30, 20, 10, 30, 10]
            let labels = [transaction[0]["date"]!, "SF", "LA", "SD", "SB", "R"]
            
            dataVisualization(data: data, labels: labels as! [String], showBar: true)
        }
        
    }
    
    @IBAction func showCategory(_ sender: AnyObject) {
        textRegion.text = "This is your statistics for the Categories that your purchases belong to."
        let data: [Double] = [10, 30, 30, 10, 10]
        let labels = ["Food", "Restaurant", "Bookstore", "Car", "Drink", "Acc"]
        
        dataVisualization(data: data, labels: labels, showBar: false)
    }
    
    @IBAction func showMonthlyAmount(_ sender: AnyObject) {
        textRegion.text = "This is your statistics for the average purcahse amount."
        let data: [Double] = [10, 30, 30, 10, 10]
        let labels = ["Food", "Restaurant", "Bookstore", "Car", "Drink", "Acc"]
        
        dataVisualization(data: data, labels: labels, showBar: false)
    }
    
    @IBAction func showTransFreq(_ sender: AnyObject) {
        textRegion.text = "This is your statistics for your transfer frequency."
        let data: [Double] = [10, 30, 30, 10, 10]
        let labels = ["Food", "Restaurant", "Bookstore", "Car", "Drink", "Acc"]
        
        dataVisualization(data: data, labels: labels, showBar: false)
    }
    
    @IBOutlet weak var dataVis: UIView!
    var toPass:Data!
    
    private func dataVisualization(data: [Double], labels: [String], showBar: Bool) {
        for v in dataVis.subviews {
            v.removeFromSuperview()
        }
        let graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.9, height: self.view.frame.height/2))
                graphView.set(data: data, withLabels: labels);
        graphView.shouldDrawBarLayer = showBar
        graphView.shouldDrawDataPoint = !showBar
        if showBar {
            graphView.lineColor = UIColor.clear
        } else {
            graphView.lineColor = UIColor.black
        }
        graphView.backgroundFillColor = UIColor.clear
        dataVis.addSubview(graphView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textRegion.text = "Please press the following buttons for your statistical consumption anaylisis."
        /*
        if let json = try? JSONSerialization.jsonObject(with: toPass) as! [String:Any] {
            showLocation(json as AnyObject)
            let transaction = json["transactions"] as! [[String:Any]]
            print("transactions")
            print(transaction[0]["date"]!)
        }
        */
        dataVis.backgroundColor = UIColor.clear
        
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor.cyan.cgColor, UIColor.white.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
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
