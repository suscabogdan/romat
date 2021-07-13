//
//  macawChartView.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 15/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import UIKit
import Foundation
import Macaw

class macawChartView: MacawView {
    
    static let progresData = createData()
    static let maxValue = 100
    static let maxValueLineHeight = 180
    static let lineWidth:Double = 275
    
    static let dataDivisor = Double(maxValue / maxValueLineHeight)
    static let adjustedData: [Double] = progresData.map({ Double($0.procent) / dataDivisor})
    static var animations: [Animation] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: macawChartView.createChart(), coder: aDecoder)
        backgroundColor = .white
    }
    
    private static func createChart() -> Group {
        var items: [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBars())
        return Group(contents: items, place: .identity)
    }
    
    private static func addYAxisItems() -> [Node] {
        let maxLines = 10
        let lineInterval = Int(maxValue / maxLines)
        let yAxisHeight:Double = 300
        let lineSpacing:Double = 30
        
        var newNodes: [Node] = []
        
        for i in 1...maxLines
        {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            
            let valueLine = Line(x1: -5, y1: y, x2: lineWidth, y2: y).stroke(fill: Color.black.with(a: 0.10))
            let valueText = Text(text: "\(i * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            valueText.fill = Color.black
            
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.black.with(a: 0.25))
        newNodes.append(yAxis)
        
        return newNodes
    }
    
    private static func addXAxisItems() -> [Node] {
        let chartBaseY: Double = 300
        var newNodes: [Node] = []
        for i in 1...adjustedData.count
        {
            let x = (Double(i) * 125)
            let valueText = Text(text: progresData[i - 1].materie, align: .max, baseline: .mid, place: .move(dx: x, dy: chartBaseY + 15))
            valueText.fill = Color.black
            newNodes.append(valueText)
        }
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.black.with(a: 0.25))
        newNodes.append(xAxis)
        
        return newNodes
    }
    
    private static func createBars() -> Group {
        
        let fill = LinearGradient(degree: 90, from: Color.black, to: Color.black.with(a: 1))
        print("1")
        let items = adjustedData.map { _ in Group() }
        print("2")
        animations = items.enumerated().map { (i: Int, item: Group) in
            item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                print("3")
                let height = adjustedData[i] * t
                print("4")
                let rect = Rect(x: Double(i) * 125 + 25, y: 300 - height, w: 30, h: height)
                print("5")
                return [rect.fill(with: fill)]
            }
        }
        print("createBars")
        return items.group()
    }
    
    static func playAnimations()
    {
        animations.combine().play()
        print("playAnimations")
    }
    
    private static func createData() -> [progres]
    {
        let romana = progres(materie: "Romana", procent: 80)
        let matematica = progres(materie: "Matematica", procent: 90)
        
        return [romana, matematica]
    }
    
}
