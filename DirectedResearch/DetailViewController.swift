//
//  DetailViewController.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 10/12/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import UIKit
import JavaScriptCore

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetailViewDelegate {

    @IBOutlet weak var textRegion: UILabel!
    @IBOutlet weak var dataVis: UIView!
    var toPass: Data!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var col1Title: UILabel!
    @IBOutlet weak var col2Title: UILabel!
    
    var tableCol1 = ["null"]
    var tableCol2 = [0.0]
    
    var showDiagram : DetailView?
    var dataSource =  DetailModel()
    
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
            return tableCol1.count
        }
        else {
            return tableCol1.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DataTableViewCell
        
        cell.column1.text = tableCol1[indexPath.row]
        cell.column2.text = "$" + String(tableCol2[indexPath.row])
        
        cell.backgroundColor = UIColor.clear
        cell.column1.textColor = UIColor.white
        cell.column2.textColor = UIColor.white
        
        if tableView == table {
            return cell
        }
        else {
            return cell
        }
        
    }
    
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
        
        switch index {
        case 0:     // Location
            showString = "This is your statistics for the Locations that you made the purchase."
            col1Title.text = "Location"
            for i in 0..<locationAmount!.count {
                data.append(locationAmount?[i]["total"] as! Double)
                labels.append(locationAmount?[i]["location"] as! String)
            }
            break
            
        case 1:     // Category
            showString = "This is your statistics for the Categories that your purchases belong to."
            col1Title.text = "Category"
            for i in 0..<categoryAmount!.count {
                data.append(categoryAmount?[i]["total"] as! Double)
                labels.append(categoryAmount?[i]["name"] as! String)
            }
            break
            
        case 2:     // MonthlyAmount
            showString = "This is your statistics for the average purcahse amount."
            col1Title.text = "Month"
            for i in 0..<monthAmount!.count {
                data.append(monthAmount?[i]["total"] as! Double)
                labels.append(monthAmount?[i]["date"] as! String)
            }
            break
            
        case 3:     // Transfer Frequency
            showString = "This is your statistics for your transfer frequency."
            col1Title.text = "Category"
            for i in 0..<categoryPercent!.count {
                data.append(categoryPercent?[i]["percent"] as! Double)
                labels.append(categoryPercent?[i]["name"] as! String)
            }
            break
        
        default:
            break
        }
        
        //textRegion.text = showString
        tableCol1 = labels
        tableCol2 = data
        table.reloadData()
        dataVis.addSubview((showDiagram?.dataVisualization(data: data, labels: labels))!)
    }
    
    
    // MARK: override functions
    override func viewDidAppear(_ animated: Bool) {
        // Since dataVis's frame is much larger then it should be when initialized in "viewDidLoad" and "viewWillAppear", put it right here without causing problem.
        showDiagram = DetailView(frame: dataVis.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.delegate = self
        
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.separatorColor = UIColor.clear
        
        col1Title.textColor = UIColor.white
        col2Title.textColor = UIColor.white
        col1Title.text = "Item"
        col2Title.text = "Amount"
        
        dataSource.inputJson(json: toPass!)
        
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: delegate functions
    func sendingJsonArray(person: DetailModel, type: FileCategory, data: [[String : Any]]) {
        switch type {
        case .category:
            categoryAmount = data
        case .location:
            locationAmount = data
        case .month:
            monthAmount = data
        default:
            break
        }
    }
    
    func sendingJsonLength(person: DetailModel, type: FileCategory, length: Int) {
        switch type {
        case .category:
            categoryAmountLeng = length
        case .location:
            locationAmountLeng = length
        case .month:
            monthAmountLeng = length
        default:
            break
        }
    }

}

