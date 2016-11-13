//
//  DetailModel.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 11/11/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import Foundation

protocol DetailViewDelegate {
    func sendingJsonArray(person: DetailModel, type: FileCategory, data: [[String:Any]])
    func sendingJsonLength(person: DetailModel, type: FileCategory, length: Int)
}

enum FileCategory {
    case month
    case location
    case category
    case transfer
}

class DetailModel {
    
    var delegate : DetailViewDelegate?
    
    func newData(type: FileCategory, data: [[String:Any]]) {
        delegate?.sendingJsonArray(person: self, type: type, data: data)
    }
    
    func newLength(type: FileCategory, length: Int) {
        delegate?.sendingJsonLength(person: self, type: type, length: length)
    }

    
    var json : Data?
    
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

    func inputJson(json: Data) {
        self.json = json
        parseJSON()
    }
    
    func parseJSON() {
        /*
        // Connected JSON use
        if let json = try? JSONSerialization.jsonObject(with: json!) as! [String:Any] {
            if json.count == 1 {
                print("something wrong.")
            } else {
                monthAmount = json["year_and_month_total_consume"] as! [[String : Any]]?
                monthAmountLeng = monthAmount?.count
                
                newData(type: FileCategory.month, data: monthAmount!)
                newLength(type: FileCategory.month, length: monthAmountLeng!)
                
                
                locationAmount = json["location_total_consume"] as! [[String:Any]]?
                locationAmountLeng = locationAmount?.count
                
                newData(type: FileCategory.location, data: locationAmount!)
                newLength(type: FileCategory.location, length: locationAmountLeng!)
                
                categoryAmount = json["categoty_transaction_total_consume"] as! [[String:Any]]?
                categoryAmountLeng = categoryAmount?.count
                
                newData(type: FileCategory.category, data: categoryAmount!)
                newLength(type: FileCategory.category, length: categoryAmountLeng!)
                
                totalAmount = json["transaction_consume_total"] as! Double?
                totalNumber = json["transaction_consume_number"] as! Int?
                
                //newData(type: FileCategory.transfer, data: totalAmount!)
                newLength(type: FileCategory.transfer, length: totalNumber!)
                
                categoryPercent = json["category_transaction_consume_percent"] as! [[String:Any]]?
                categoryPercentLeng = categoryPercent?.count
                
            }
            
        }
        */
        
        // Hard-coded JSON for testing use
        monthAmount = JSO["year_and_month_total_consume"] as! [[String : Any]]?
        monthAmountLeng = monthAmount?.count
        
        newData(type: FileCategory.month, data: monthAmount!)
        newLength(type: FileCategory.month, length: monthAmountLeng!)
        
        
        locationAmount = JSO["location_total_consume"] as! [[String:Any]]?
        locationAmountLeng = locationAmount?.count
        
        newData(type: FileCategory.location, data: locationAmount!)
        newLength(type: FileCategory.location, length: locationAmountLeng!)
        
        categoryAmount = JSO["categoty_transaction_total_consume"] as! [[String:Any]]?
        categoryAmountLeng = categoryAmount?.count
        
        newData(type: FileCategory.category, data: categoryAmount!)
        newLength(type: FileCategory.category, length: categoryAmountLeng!)
        
        totalAmount = JSO["transaction_consume_total"] as! Double?
        totalNumber = JSO["transaction_consume_number"] as! Int?
        
        //newData(type: FileCategory.transfer, data: totalAmount!)
        newLength(type: FileCategory.transfer, length: totalNumber!)
        
        categoryPercent = JSO["category_transaction_consume_percent"] as! [[String:Any]]?
        categoryPercentLeng = categoryPercent?.count
        

    }
    
}
