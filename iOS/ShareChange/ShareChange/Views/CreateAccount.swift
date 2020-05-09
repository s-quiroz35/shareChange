//
//  CreateAccount.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct CreateAccount: View {
    @Environment(\.presentationMode)var presentationMode
    @EnvironmentObject var userDataModel: UserDataModel
    @State var email = ""
    @State var username = ""
    @State var password = ""
    @State var fname = ""
    @State var lname = ""
    @State var repeatPassword = ""
    @State var bankAccountNumber = ""
    @State var errorTxt = ""
    @State var showOverlay = false
    @State var isLoading = false
    var body: some View {
        ZStack {
            if showOverlay {
                Color(.black).opacity(0.4).edgesIgnoringSafeArea(.all)
                ZStack {
                    ActivityIndicator(shouldAnimate: self.$isLoading)
                    if !isLoading {
                        VStack {
                            Text(errorTxt)
                            Divider()
                            Button(action: {
                                self.showOverlay = false
                            }) {
                                Text("OK")
                            }
                        }
                    }
                }.padding().frame(width: 250).background(Color.white).cornerRadius(10).shadow(radius: 5)
            }
            VStack {
                Text("Account Creation").font(Constants.subHeadlineFont).padding([.top, .bottom], 30)
                HStack {
                    FormInput(title: "First Name", field: TextField("John", text: $email), required: false)
                    FormInput(title: "Last Name", field: TextField("Doe", text: $email), required: false)
                }
                FormInput(title: "Email", field: TextField("jdoe@email.com", text: $email), required: true)
                FormInput(title: "Password", secureField: SecureField("8 or more characters", text: $password), required: true)
                FormInput(title: "Confirm Password", secureField: SecureField("8 or more characters", text: $repeatPassword), required: true)
                Spacer()
                Image("placeholderImage").resizable().aspectRatio(1.6, contentMode: .fit).padding()
                Button(action: {
                    self.showOverlay = true
                    self.isLoading = true
                    self.userDataModel.createAccount(fname: self.fname, lname: self.lname, email: self.username, password: self.password, repeatPassword: self.repeatPassword, onComplete: {
                        self.isLoading = false
                        self.showOverlay = false
                        self.presentationMode.wrappedValue.dismiss()
                    }) { (errorMessage) in
                        withAnimation {
                            self.errorTxt = errorMessage
                            self.isLoading = false
                        }
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Create Account")
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
            }
        }
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount().environmentObject(UserDataModel())
    }
}
