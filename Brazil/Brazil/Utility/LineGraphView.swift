//
//  LineGraphView.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct LineGraphView: View {
    
    let dataPoints: [Double]
    let lineColor: Color
    
    init(dataPoints: [Double], lineColor: Color = .blue) {
        self.dataPoints = dataPoints
        self.lineColor = lineColor
    }
    
    var body: some View {
        GeometryReader { geometry in
            let frame = CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height)
            let xStep = frame.width / CGFloat(dataPoints.count - 1)
            let yScale = frame.height / CGFloat(dataPoints.max() ?? 1)
            
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: frame.height))
                    var previousPoint = path.currentPoint
                    
                    for index in dataPoints.indices {
                        let x = xStep * CGFloat(index)
                        let y = frame.height - CGFloat(dataPoints[index]) * yScale
                        let currentPoint = CGPoint(x: x, y: y)
                        
                        let distance = currentPoint.x - previousPoint!.x
                        let controlPoint1 = previousPoint!.offsetBy(dx: distance / 2, dy: 0)
                        let controlPoint2 = currentPoint.offsetBy(dx: -distance / 2, dy: 0)
                        path.addCurve(to: currentPoint, control1: controlPoint1, control2: controlPoint2)
                        
                        previousPoint = currentPoint
                    }
                }
                .stroke(lineColor, lineWidth: 2)
            }
            //.frame(height: 150)
        }
    }
//    let dataPoints: [Double]
//    let lineColor: Color
//
//    init(dataPoints: [Double], lineColor: Color = .blue) {
//        self.dataPoints = dataPoints
//        self.lineColor = lineColor
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            let frame = CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height)
//            ZStack {
//                Path { path in
//                    path.move(to: CGPoint(x: 0, y: frame.height))
//                    let xStep = frame.width / CGFloat(dataPoints.count - 1)
//                    for index in dataPoints.indices {
//                        let x = xStep * CGFloat(index)
//                        let y = frame.height - CGFloat(dataPoints[index]) / CGFloat(dataPoints.max() ?? 1) * frame.height
//                        path.addLine(to: CGPoint(x: x, y: y))
//                    }
//                }
//                .stroke(lineColor, lineWidth: 2)
//            }
//            .frame(height: 150)
//        }
//    }
}
//struct LineGraphView: View {
//    let dataPoints: [Double]
//    let lineColor: Color
//    
//    init(dataPoints: [Double], lineColor: Color = .blue) {
//        self.dataPoints = dataPoints
//        self.lineColor = lineColor
//    }
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let frame = CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height)
//            let xStep = frame.width / CGFloat(dataPoints.count - 1)
//            let yScale = frame.height / CGFloat(dataPoints.max() ?? 1)
//            
//            ZStack {
//                Path { path in
//                    path.move(to: CGPoint(x: 0, y: frame.height))
//                    var previousPoint = path.currentPoint
//                    
//                    for index in dataPoints.indices {
//                        let x = xStep * CGFloat(index)
//                        let y = frame.height - CGFloat(dataPoints[index]) * yScale
//                        let currentPoint = CGPoint(x: x, y: y)
//                        
//                        let distance = currentPoint.x - previousPoint.x
//                        let controlPoint1 = previousPoint.offsetBy(dx: distance / 2, dy: 0)
//                        let controlPoint2 = currentPoint.offsetBy(dx: -distance / 2, dy: 0)
//                        path.addCurve(to: currentPoint, control1: controlPoint1, control2: controlPoint2)
//                        
//                        previousPoint = currentPoint
//                    }
//                }
//                .stroke(lineColor, lineWidth: 2)
//            }
//            .frame(height: 150)
//        }
//    }
//}
//

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + dx, y: self.y + dy)
    }
}
