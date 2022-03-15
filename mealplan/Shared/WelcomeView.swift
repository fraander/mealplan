//
//  WelcomeView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

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

struct WelcomeView: View {
    
    @State private var first = ""
    @State private var last = ""
    @State private var email = ""
    @State private var gender: Gender = Gender.none
    @State private var dob = Date(timeIntervalSince1970: 86400.0 )
    
    @State private var showHeightPicker: Bool = true
    @State private var heightFeet: Int? = nil
    @State private var heightInches: Int? = nil
    @State private var weight: Int? = nil
    
    var body: some View {
        VStack {
            Form {
                
                Section {
                    TextField("First Name", text: $first)
                    TextField("Last Name", text: $last)
                    TextField("Email Address", text: $email)
                    
                }
                
                Section {
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
                    
                    DatePicker("Date of Birth", selection: $dob, displayedComponents: [.date])
                }
                
                Section {
                    HStack {
                        Text("Height")
                        
                        Spacer()
                        
                        TextField(
                            "ft.",
                            value: $heightFeet,
                            format: .number
                        )
                            .keyboardType(.numberPad)
                            .frame(width: 60)
                        TextField(
                            "in.",
                            value: $heightInches,
                            format: .number
                        )
                            .keyboardType(.numberPad)
                            .frame(width: 60)
                    }
                    
                    
                    HStack {
                        Text("Weight")
                        
                        Spacer()
                        
                        TextField(
                            "lbs.",
                            value: $weight,
                            format: .number
                        )
                            .keyboardType(.numberPad)
                            .frame(width: 60)
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
    }
}
