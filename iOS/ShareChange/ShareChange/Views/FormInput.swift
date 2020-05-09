//
//  FormInput.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct FormInput<Label: View>: View {
    var isSecure: Bool?
    var title: String
    var field: TextField<Label>?
    var secureField: SecureField<Label>?
    var required: Bool?
    var body: some View {
        VStack {
            HStack {
                Text(title).font(Constants.textFont) + (required == nil || required == false ? Text("") : Text("*").font(Constants.textFont).foregroundColor(.red))
                Spacer()
            }
            secureField
            field
            Divider()
        }.padding([.leading, .trailing, .bottom])
    }
}

struct FormInput_Previews: PreviewProvider {
    static var previews: some View {
        FormInput(title: "Email", field: TextField("", text: Binding.constant("")), required: true)
    }
}
