//
//  Welcome_Body.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

struct Welcome_Body: View {
    
    enum Field {
        case name, email
    }
    
    @Binding var currentPage: WelcomePage
    
    @FocusState private var focusedField: Field?
    
    @State private var heightFeet: Int? = nil
    @State private var heightInches: Int? = nil
    @State private var weight: Int? = nil
    
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
                    
                    Text("Health Information")
                        .font(.system(.headline, design: .rounded))
                    
                    VStack(spacing: 8) {
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
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 5.0)
                                .fill(.white)
                        )
                        
                        
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

struct Welcome_Body_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_Body(currentPage: .constant(.body))
    }
}
