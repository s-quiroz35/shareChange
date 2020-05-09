//
//  Triangle.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/9/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct Triangle: View {
    let shapeWidth: CGFloat
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: shapeWidth))
            path.addLine(to: CGPoint(x: shapeWidth, y: 0))
        }.frame(width: shapeWidth, height: shapeWidth)
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle(shapeWidth: 80)
    }
}
