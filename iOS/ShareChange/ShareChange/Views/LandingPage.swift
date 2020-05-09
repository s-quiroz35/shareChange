//
//  LandingPage.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct LandingPage: View {
    @EnvironmentObject var userDataModel: UserDataModel
    @State var createAccountModal = false
    @State var loginModal = false
    @State var degrees: Double = 0
    @State var isAnimating = true
    
    var repeatingAnimation: Animation {
        Animation.linear(duration: 10).repeatForever(autoreverses: false)
    }
    
    var body: some View {
        VStack {
            Group {
                Text("Share")
                    .font(Constants.headlineFont)
                    .foregroundColor(Color("secondary_color"))
                + Text("Change").font(Constants.headlineFont)
                    .foregroundColor(.orange)
            }.padding(.top, 50)
            Image("charity").resizable().aspectRatio(1, contentMode: .fit)
                .padding([.leading, .trailing])
                .padding(.top, 10)
                .rotationEffect(.degrees(self.degrees))
                    .animation(self.repeatingAnimation)
                    .onAppear {
                        self.degrees = 360
                }
            Text("Make a Difference, Pennies at a Time")
                .font(Constants.subHeadlineFont)
                .multilineTextAlignment(.center)
                .padding(.top, 60)
            Text("Share your spare change with organizations that provide supplies for those in need during these tough times. With the touch of a button, you can make an impact worldwide.")
                .font(Constants.textFont)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 20)
            Spacer()
            Button(action: {
                self.createAccountModal = true
            }) {
                HStack {
                    Spacer()
                    Text("Get Started")
                        .font(Constants.textFont)
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 45)
                    Spacer()
                }
            }
            .background(Constants.primaryColor)
                .cornerRadius(22)
            .padding([.leading, .trailing])
            .sheet(isPresented: $createAccountModal, content: {
                CreateAccount().environmentObject(self.userDataModel)
            })
            Divider()
            Button(action: {
                self.loginModal = true
            }) {
                Text("Login")
                    .font(Constants.textFont)
                    .bold()
                    .foregroundColor(Constants.primaryColor)
            }.sheet(isPresented: $loginModal, content: {
                Login(userDataModel: self.userDataModel)
            })
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage().previewDevice(PreviewDevice(rawValue: "iPhone XR"))
    }
}
