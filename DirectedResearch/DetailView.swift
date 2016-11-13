//
//  DetailView.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 11/12/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataVisualization(data: [Double], labels: [String]) -> UIView {
        
        let graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        
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
        
        return graphView
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
