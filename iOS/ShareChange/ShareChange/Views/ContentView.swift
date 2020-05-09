//
//  ContentView.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    var body: some View {
        ZStack {
            if self.userDataModel.user != nil {
                MainView()
            } else {
                LandingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserDataModel())
    }
}
