//
//  DonationsView.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct DonationsView: View {
    @Binding var scrollOffset: CGFloat
    let gradient = Gradient(colors: [Color("primary_color"), Color("secondary_color")])
    @State var selected = 0
    var body: some View {
        ZStack {
            ScrollView([.vertical], showsIndicators: true) {
                GeometryReader { reader in
                    Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: [self.getOffset(for: reader)])
                }
                ForEach(0..<15) { _ in
                    TestView()
                }.offset(x: 0, y: 30)
            }.onPreferenceChange(ScrollOffsetPreferenceKey.self) { (val) in
                print("New Val: \(val[0])")
                self.scrollOffset = val[0]
            }
            VStack {
                HStack {
                    DonationTypeDropdown(options: Constants.dropdownOptions, selected: self.$selected)
                    Spacer()
                }
                Spacer()
            }.padding()
        }
    }
    private func getOffset(for geo: GeometryProxy) -> CGFloat {
        print("ABC: \(geo.frame(in: .global).minY)")
        return geo.frame(in: .global).minY
    }
}

struct DonationsView_Previews: PreviewProvider {
    static var previews: some View {
        DonationsView(scrollOffset: Binding.constant(0))
    }
}

struct TestView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Placeholder").padding()
            Spacer()
        }.frame(height: .random(in: 50..<150)).background(Color.white).cornerRadius(10).padding().padding(.bottom, 20).shadow(radius: 10)
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}
