//
//  UserDataModel.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import Foundation

class UserDataModel: ObservableObject {
    @Published var user: User?
    
    func createAccount(fname: String, lname: String, email: String, password: String, repeatPassword: String, onComplete: @escaping () -> Void, onFail: @escaping (String) -> Void) {
        //DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if password != repeatPassword {
                onFail("Passwords do not match")
            } else {
                print("Success!")
                self.user = User(fname: fname, lname: lname, email: email, totalDonation: 0, bankAccountNumber: nil, cardNumber: nil)
                onComplete()
            }
        //}
    }
}
