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
