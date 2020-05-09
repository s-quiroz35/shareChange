//
//  Constants.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI

struct Constants {
    static var headlineFont = Font.custom("GillSans-SemiBold", size: 55)
    static var subHeadlineFont = Font.custom("GillSans-SemiBold", size: 20)
    static var textFont = Font.custom("GillSans-Light", size: 15)
    static var boldTextFont = Font.custom("GillSans-SemiBold", size: 15)
    static var smallTextFont = Font.custom("GillSans-Light", size: 8)
    
    static var primaryColor = Color(.sRGB, red: 213/255, green: 30/255, blue: 72/255, opacity: 1)
    
    static var sampleUser = User(fname: "John", lname: "Doe", email: "jdoe@email.com", totalDonation: 420)
    
    static var dropdownOptions = [DropdownItem(text: "Masks", image: Image(systemName: "moon.fill")), DropdownItem(text: "Meals", image: Image(systemName: "leaf.arrow.circlepath")), DropdownItem(text: "Families", image: Image(systemName: "person.3.fill"))]
}
