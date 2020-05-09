//
//  DonationTypeDropdown.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/9/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct DonationTypeDropdown: View {
    @State var showOptions = false
    var options: [DropdownItem]
    @Binding var selected: Int
    let buttonHeight: CGFloat = 40
    var body: some View {
        ZStack {
            ForEach(0..<options.count, id: \.self) { i in
                HStack {
                    Color.clear.frame(width: self.buttonHeight, height: self.buttonHeight)
                Button(action: {
                    withAnimation {
                        self.selected = i
                        self.showOptions = false
                    }
                }) {
                    HStack {
                        Text(self.options[i].text).frame(width: 120, height: self.buttonHeight).background(Color.white).cornerRadius(20).shadow(radius: self.showOptions ? 5 : 0)
                    }.foregroundColor(.black)
                }.buttonStyle(DropdownButtonStyle()).offset(x: 0, y: self.showOptions ? CGFloat(i + 1) * (self.buttonHeight + 5) : 0)
                }
            }.animation(self.showOptions ? .interpolatingSpring(mass: 1, stiffness: 10, damping: 5, initialVelocity: 4) : .easeIn)
            Button(action: {
                withAnimation {
                    self.showOptions.toggle()
                }
            }) {
                HStack {
                    Image(systemName: self.showOptions ? "chevron.up" : "chevron.down").frame(width: 40, height: buttonHeight).background(Color.white).cornerRadius(20).shadow(radius: 5)
                    Text(self.options[selected].text).frame(width: 120, height: buttonHeight).background(Color.white).cornerRadius(20).shadow(radius: 5)
                }.foregroundColor(.black)
            }.buttonStyle(DropdownButtonStyle())
        }
    }
}

struct DonationTypeDropdown_Previews: PreviewProvider {
    static var previews: some View {
        DonationTypeDropdown(options: Constants.dropdownOptions, selected: Binding.constant(0))
    }
}

struct DropdownButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .background(Color.clear)
    }
}

struct DropdownItem {
    var text: String
    var image: Image
}
