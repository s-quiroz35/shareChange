//
//  InformationView.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct InformationView: View {
    let gradient = Gradient(colors: [Constants.primaryColor, Color("secondary_color")])
    @Binding var scrollOffset: CGFloat
    var body: some View {
        ScrollView([.vertical], showsIndicators: true) {
            GeometryReader { reader in
                Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: [self.getOffset(for: reader)])
            }
            HStack {
                Spacer()
                Text("Donations").padding()
                Spacer()
            }.background(Color.white).cornerRadius(10).padding().shadow(radius: 10)
            ForEach(0..<15) { _ in
                TestView()
            }
        }.onPreferenceChange(ScrollOffsetPreferenceKey.self) { (val) in
            print("New Val: \(val[0])")
            self.scrollOffset = val[0]
        }
    }
    private func getOffset(for geo: GeometryProxy) -> CGFloat {
        print("ABC: \(geo.frame(in: .global).minY)")
        return geo.frame(in: .global).minY
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(scrollOffset: Binding.constant(0))
    }
}
