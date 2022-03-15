//
//  Welcome_Account.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

struct Welcome_Account: View {
    
    enum Field {
        case name, email
    }
    
    @Binding var currentPage: WelcomePage
    
    @FocusState private var focusedField: Field?
    
    @State private var name = ""
    @State private var email = ""
    
    var preventNextPage: Bool {
        return !(name.count >= 3 && name.contains(" ")) || !(email.count >= 3 && email.contains("@"))
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color(red: 0.839, green: 0.863, blue: 0.863, opacity: 1.000))
            
            ScrollView {
                VStack(spacing: 16) {
                    Image("Wireframe_Standing_Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.top, 100)
                    
                    Text("Create your account")
                        .font(.system(.headline, design: .rounded))
                    
                    VStack(spacing: 8) {
                        TextField("Name", text: $name)
                            .focused($focusedField, equals: .name)
                            .submitLabel(.next)
                            .onSubmit {
                                focusedField = .email
                            }
                        
                        TextField("Email", text: $email)
                            .focused($focusedField, equals: .email)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.done)
                            .onSubmit {
                                focusedField = nil
                            }
                    }
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.horizontal)

                    Button {
                        withAnimation {
                            currentPage = .personalDetails
                        }
                    } label: {
                        Text("Create Account")
                            .font(.system(.headline, design: .rounded))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.639, green: 0.702, blue: 0.400, opacity: 1.000))
                    .disabled(preventNextPage)
                    
                }
            }
        }
        .padding(.bottom)
        .padding(.horizontal)
        .padding(.horizontal)
    }
}

struct Welcome_Account_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_Account(currentPage: .constant(.account))
    }
}
