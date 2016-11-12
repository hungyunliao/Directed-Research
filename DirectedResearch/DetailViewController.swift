//
//  DetailViewController.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 10/12/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import UIKit
import JavaScriptCore

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var textRegion: UILabel!
    @IBOutlet weak var dataVis: UIView!
    var toPass: Data!
    @IBOutlet weak var table: UITableView!
    
    let animalArray = ["cat", "dog", "elephant", "rabbit"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == table {
            return 1
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table {
            return animalArray.count
        }
        else {
            return animalArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = animalArray[indexPath.row]
        if tableView == table {
            return cell
        }
        else {
            return cell
        }
        
    }
    
    // Hard-coded Json file for testing use
    let JSO:[String:Any] = [
        "year_and_month_total_consume": [
            ["date": "2014-05", "total": 19.97],
            ["date": "2014-04", "total": 272.12],
            ["date": "2014-07", "total": 440.0],
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
            ["total": 880.0, "name": "Transfer"],
            ["total": 2425.38, "name": "Shops"],
            ["total": 44.31, "name": "Food and Drink"]
        ],
        "transfer_total_amount": 480,
        "transaction_consume_total": 3362.4300000000003,
        "transaction_consume_number": 12,
        "category_transaction_consume_percent": [
            ["percent": 73.333, "name": "Transfer"],
            ["percent": 202.115, "name": "Shops"],
            ["percent": 3.69, "name": "Food and Drink"]
        ]
    ]
    
    // Json parsing parameters
    var monthAmount : [[String:Any]]? = nil
    var monthAmountLeng : Int? = nil
    
    var locationAmount : [[String:Any]]? = nil
    var locationAmountLeng : Int? = nil
    
    var categoryAmount : [[String:Any]]? = nil
    var categoryAmountLeng : Int? = nil
    
    var totalAmount : Double? = nil
    
    var totalNumber : Int? = nil
    
    var categoryPercent : [[String:Any]]? = nil
    var categoryPercentLeng : Int? = nil

    
    // Segment control
    @IBAction func shownDataType(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        var showString = ""
        var data: [Double] = []
        var labels: [String] = []
        var showBar = true
        
        switch index {
        case 0:     // Location
            showString = "This is your statistics for the Locations that you made the purchase."
            
            for i in 0..<locationAmount!.count {
                data.append(locationAmount?[i]["total"] as! Double)
                labels.append(locationAmount?[i]["location"] as! String)
            }
            break
            
        case 1:     // Category
            showString = "This is your statistics for the Categories that your purchases belong to."
            
            for i in 0..<categoryAmount!.count {
                data.append(categoryAmount?[i]["total"] as! Double)
                labels.append(categoryAmount?[i]["name"] as! String)
            }
            break
            
        case 2:     // MonthlyAmount
            showString = "This is your statistics for the average purcahse amount."
            for i in 0..<monthAmount!.count {
                data.append(monthAmount?[i]["total"] as! Double)
                labels.append(monthAmount?[i]["date"] as! String)
            }
            showBar = false
            break
            
        case 3:     // Transfer Frequency
            showString = "This is your statistics for your transfer frequency."
            for i in 0..<categoryPercent!.count {
                data.append(categoryPercent?[i]["percent"] as! Double)
                labels.append(categoryPercent?[i]["name"] as! String)
            }
            showBar = false
            break
        
        default:
            break
        }
        
        //textRegion.text = showString
        dataVisualization(data: data, labels: labels, showBar: showBar)
    }
    
    private func dataVisualization(data: [Double], labels: [String], showBar: Bool) {
        for v in dataVis.subviews {
            v.removeFromSuperview()
        }
        
        let graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.9, height: self.view.frame.height/2))
        
        
        graphView.set(data: data, withLabels: labels)
        graphView.shouldAdaptRange = true
        graphView.dataPointSpacing = 80
        graphView.shouldRangeAlwaysStartAtZero = true
        graphView.backgroundFillColor = UIColor.init(colorLiteralRed: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        
        graphView.rangeMax = 50
        
        graphView.lineWidth = 1
        graphView.lineColor = UIColor.init(colorLiteralRed: 119/255, green: 119/255, blue: 119/255, alpha: 1)
        graphView.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        graphView.shouldFill = true
        graphView.fillType = ScrollableGraphViewFillType.gradient
        graphView.fillColor = UIColor.init(colorLiteralRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        graphView.fillGradientType = ScrollableGraphViewGradientType.linear
        graphView.fillGradientStartColor = UIColor.init(colorLiteralRed: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        graphView.fillGradientEndColor = UIColor.init(colorLiteralRed: 68/255, green: 68/255, blue: 68/255, alpha: 1)
        
        graphView.dataPointSpacing = 80
        graphView.dataPointSize = 2
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        dataVis.addSubview(graphView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        
        
        /*
        // For connected JSON
        if let json = try? JSONSerialization.jsonObject(with: toPass) as! [String:Any] {
            if json.count == 1 {
                print("something wrong.")
            } else {
                monthAmount = json["year_and_month_total_consume"] as! [[String : Any]]?
                monthAmountLeng = monthAmount?.count
                
                locationAmount = json["location_total_consume"] as! [[String:Any]]?
                locationAmountLeng = locationAmount?.count
                
                categoryAmount = json["categoty_transaction_total_consume"] as! [[String:Any]]?
                categoryAmountLeng = categoryAmount?.count
                
                totalAmount = json["transaction_consume_total"] as! Double?
                totalNumber = json["transaction_consume_number"] as! Int?
                
                categoryPercent = json["category_transaction_consume_percent"] as! [[String:Any]]?
                categoryPercentLeng = categoryPercent?.count
            }
            
        }
        */
        
        
        // For hard-code JSON
        monthAmount = JSO["year_and_month_total_consume"] as! [[String : Any]]?
        monthAmountLeng = monthAmount?.count
        
        locationAmount = JSO["location_total_consume"] as! [[String:Any]]?
        locationAmountLeng = locationAmount?.count
        
        categoryAmount = JSO["categoty_transaction_total_consume"] as! [[String:Any]]?
        categoryAmountLeng = categoryAmount?.count
        
        totalAmount = JSO["transaction_consume_total"] as! Double?
        totalNumber = JSO["transaction_consume_number"] as! Int?
        
        categoryPercent = JSO["category_transaction_consume_percent"] as! [[String:Any]]?
        categoryPercentLeng = categoryPercent?.count
        
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
