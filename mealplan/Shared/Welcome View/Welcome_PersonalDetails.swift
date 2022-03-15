//
//  Welcome_PersonalDetails.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

struct Welcome_PersonalDetails: View {
    
    enum Gender: CustomStringConvertible {
        case male, female, preferNotToSay, none
        
        var description: String {
            switch self {
                case .none:
                    return ""
                case .male:
                    return "Male"
                case .female:
                    return "Female"
                case .preferNotToSay:
                    return "Prefer not to say"
            }
        }
    }
    
    enum Field {
        case gender, dob
    }
    
    @Binding var currentPage: WelcomePage
    
    @FocusState private var focusedField: Field?
    
    
    @State private var gender: Gender = Gender.none
    @State private var dob = Date(timeIntervalSince1970: 86400.0 )
    
    var preventNextPage: Bool {
        return false
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
                    
                    Text("Personal Details")
                        .font(.system(.headline, design: .rounded))
                    
                    VStack(spacing: 8) {
                        HStack {
                            Text("Gender")
                            
                            Spacer()
                            
                            Picker(selection: $gender) {
                                Text(Gender.female.description)
                                    .tag(Gender.female)
                                
                                Text(Gender.male.description)
                                    .tag(Gender.male)
                                
                                Text(Gender.preferNotToSay.description)
                                    .tag(Gender.preferNotToSay)
                            } label: {
                                Text("Gender")
                            }
                        }
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 5.0)
                                .fill(.white)
                        )
                        
                        DatePicker("Date of Birth", selection: $dob, displayedComponents: [.date])
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 5.0)
                                    .fill(.white)
                            )
                    }
                    .padding(.horizontal)
                    
                    Button {
                        withAnimation {
                            currentPage = .body
                        }
                    } label: {
                        Text("Next Page")
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

struct Welcome_PersonalDetails_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_PersonalDetails(currentPage: .constant(.personalDetails))
    }
}
