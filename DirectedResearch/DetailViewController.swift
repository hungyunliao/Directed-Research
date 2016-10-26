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
    @IBOutlet weak var dataVis: UIView!
    var toPass:Data!
    let JSO:[String:Any] = [
        "year_and_month_total_consume": [
            ["date": "2014-05", "total": 19.97],
            ["date": "2014-04", "total": 272.12],
            ["date": "2014-07", "total": 440],
            ["date": "2014-06", "total": 2630.34]
        ],
        "location_total_consume": [
            ["total": 2587.15, "location": "San Francisco"],
            ["total": 5.32, "location": "Atlanta"],
            ["total": 15.93, "location": "New York"],
            ["total": 28.57, "location": "Metairie"],
            ["total": 7.23, "location": "Winston Salem"]
        ],
        "categoty_transaction_total_consume": [
            ["total": 5.0, "name": "Transfer"],
            ["total": 2.0, "name": "Shops"],
            ["total": 4.0, "name": "Food and Drink"]
        ],
        "transaction_consume_total": 3362.4300000000003,
        "transaction_consume_number": 12,
        "category_transaction_consume_percent": [
            ["percent": 0.4166666666666667, "name": "Transfer"],
            ["percent": 0.16666666666666666, "name": "Shops"],
            ["percent": 0.3333333333333333, "name": "Food and Drink"]
        ]
    ]
    
    
    @IBAction func showLocation(_ sender: AnyObject) {
        textRegion.text = "This is your statistics for the Locations that you made the purchase."
        
        if let json = try? JSONSerialization.jsonObject(with: toPass) as! [String:Any] {
            let transaction = json["transactions"] as! [[String:Any]]
            print("transactions")
            print(transaction[0]["date"]!)
            
            let data: [Double] = [30, 20, 10, 30, 10]
            let labels = ["NY", "SF", "LA", "SD", "SB", "R"]
            
            dataVisualization(data: data, labels: labels as! [String], showBar: true)
        }
        
    }
    
    @IBAction func showCategory(_ sender: AnyObject) {
        textRegion.text = "This is your statistics for the Categories that your purchases belong to."
        
        if let json = try? JSONSerialization.jsonObject(with: toPass) as! [String:Any] {
            let transaction = json["transactions"] as! [[String:Any]]
            print("transactions")
            print(transaction[0]["date"]!)
            
            let data: [Double] = [20, 30, 30, 10, 10]
            let labels = ["Food", "Drinks", "Entertain", "Restaurant", "Bookstore"]
            
            dataVisualization(data: data, labels: labels as! [String], showBar: true)
        }
        
    }
    
    @IBAction func showMonthlyAmount(_ sender: AnyObject) {
        textRegion.text = "This is your statistics for the average purcahse amount."
        
        if let json = try? JSONSerialization.jsonObject(with: toPass) as! [String:Any] {
            let transaction = json["transactions"] as! [[String:Any]]
            print("transactions")
            print(transaction[0]["date"]!)
            
            let data: [Double] = [378, 295, 598, 100, 1009]
            let labels = ["May.16", "Jun.16", "Jul.16", "Aug.16", "Sep.16", "Oct.16"]
            
            dataVisualization(data: data, labels: labels as! [String], showBar: false)
        }
    }
    
    @IBAction func showTransFreq(_ sender: AnyObject) {
        textRegion.text = "This is your statistics for your transfer frequency."
        
        if let json = try? JSONSerialization.jsonObject(with: toPass) as! [String:Any] {
            let transaction = json["transactions"] as! [[String:Any]]
            print("transactions")
            print(transaction[0]["date"]!)
            
            let data: [Double] = [17, 30, 0, 25, 10]
            let labels = ["May.16", "Jun.16", "Jul.16", "Aug.16", "Sep.16", "Oct.16"]
            
            dataVisualization(data: data, labels: labels as! [String], showBar: false)
        }
        
    }
    
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
        graphView.shouldAdaptRange = true
        dataVis.addSubview(graphView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textRegion.text = "Please press the following buttons for your statistical consumption anaylisis."
        
        dataVis.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        let gradientBackground = gradient(frame: self.view.frame)
        self.view.layer.insertSublayer(gradientBackground, at: 0)
        
        print("hereherehere")
        print(JSONSerialization.isValidJSONObject(JSO))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

}

func gradient(frame: CGRect) -> CAGradientLayer {
    let gradient = CAGradientLayer()
    
    gradient.colors = [UIColor.cyan.cgColor, UIColor.white.cgColor]
    gradient.locations = [0.0 , 1.0]
    gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradient.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
    
    return gradient
}
