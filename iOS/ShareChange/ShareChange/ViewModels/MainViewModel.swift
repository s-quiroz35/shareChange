//
//  MainViewModel.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/9/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI
import GameplayKit

class MainViewModel: ObservableObject {
    var numShapes = 100
    var positions = [CGPoint]()
    var rotations = [Angle]()
    var shapeWidth: CGFloat = 60
    let padding: CGFloat = 20
    
    init() {
        getPositions()
    }
    
    func getPositions() {
        let height = UIScreen.main.bounds.height * 3
        let width = UIScreen.main.bounds.width
        print("WIDTH: \(width), HEIGHT: \(height)")
        for num in 0..<numShapes {
            var x = CGFloat.random(in: 0..<width * 3)
            var y = CGFloat.random(in: 0..<height)
            var pos = CGPoint(x: x, y: y)
            while (overlaps(pos: pos)) {
                x = CGFloat.random(in: 0..<width * 3)
                y = CGFloat.random(in: 0..<height)
                pos = CGPoint(x: x, y: y)
            }
            print("\(num): (\(x), \(y))")
            positions.append(pos)
            rotations.append(.degrees(.random(in: 0..<360)))
        }
    }
    
    func overlaps(pos: CGPoint) -> Bool {
        for p in positions {
            if inRect(pos: pos, in: p) {
                return true
            }
        }
        return false
    }
    
    func inRect(pos: CGPoint, in pos2: CGPoint) -> Bool {
        let minWidth = pos2.x - shapeWidth / 2
        let maxWidth = minWidth + shapeWidth
        let minHeight = pos2.y - shapeWidth / 2
        let maxHeight = minHeight + shapeWidth
        let inWidth = pos.x < maxWidth - padding && pos.x > minWidth + padding
        let inHeight = pos.y < maxHeight - padding && pos.y > minHeight + padding
        return inWidth && inHeight
    }
}
