//
//  User.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import Foundation

struct User {
    var id = UUID()
    var fname: String
    var lname: String
    var name: String {
        "\(fname) \(lname)"
    }
    var email: String
    var totalDonation: Double
    var bankAccountNumber: String?
    var cardNumber: String?
}
