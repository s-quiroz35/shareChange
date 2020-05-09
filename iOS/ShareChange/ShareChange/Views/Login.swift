//
//  Login.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct Login: View {
    @ObservedObject var userDataModel: UserDataModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(userDataModel: UserDataModel())
    }
}
