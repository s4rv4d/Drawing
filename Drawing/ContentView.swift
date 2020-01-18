//
//  ContentView.swift
//  Drawing
//
//  Created by Sarvad shetty on 1/17/20.
//  Copyright © 2020 Sarvad shetty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Path { path in
//
//            //drawing a triangle
//            path.move(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//        }
////        .fill(Color.blue)
//            .stroke(Color.blue.opacity(0.25), lineWidth: 3)
        
//        Triangle()
//            .fill(Color.red)
//        .frame(width: 200, height: 200)
        
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockWise: true)
            .strokeBorder(Color.blue, lineWidth: 10)
//            .frame(width: 300, height: 300)
//        Circle()
//            .strokeBorder(Color.blue, lineWidth: 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Triangle
struct Triangle: Shape {
    func path(in rect:CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}


//Arc
struct Arc: Shape, InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect:CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockWise)
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

//strokeBorder part of InsettableShape protocol
//need to confirm by using inset(by:) func
