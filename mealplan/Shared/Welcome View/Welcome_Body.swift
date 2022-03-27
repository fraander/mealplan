//
//  Welcome_Body.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

struct Welcome_Body: View {
    
    enum Field {
        case feet, inches, lbs
    }
    
    @Binding var currentPage: WelcomePage
    
    @FocusState private var focusedField: Field?
    
    @State private var heightFeet: Int? = nil
    @State private var heightInches: Int? = nil
    @State private var weight: Int? = nil
    
    var preventNextPage: Bool {
        return !(heightFeet != nil && heightInches != nil && weight ?? 1001 < 1000)
    }
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color(red: 0.839, green: 0.863, blue: 0.863, opacity: 1.000))
            
            ScrollView {
                VStack(spacing: 16) {
                    Image("whiteboard_walking")
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
                            
                            ZStack {
                                if heightFeet != nil && heightFeet != 0 {
                                    Text("\(heightFeet ?? 0)").foregroundColor(.clear) + Text("ft.")
                                }
                                
                                TextField(
                                    "ft.",
                                    value: $heightFeet,
                                    format: .number
                                )
                                    .keyboardType(.numberPad)
                                    .submitLabel(.next)
                                    .onSubmit {
                                        focusedField = .inches
                                    }
                                    .focused($focusedField, equals: .feet)
                                    .frame(width: 40)
                            }
                            
                            ZStack {
                                if heightInches != nil && heightInches != 0 {
                                    Text("\(heightInches ?? 0)").foregroundColor(.clear) + Text("in.")
                                }
                                
                                TextField(
                                    "in.",
                                    value: $heightInches,
                                    format: .number
                                )
                                    .keyboardType(.numberPad)
                                    .submitLabel(.next)
                                    .onSubmit {
                                        focusedField = .lbs
                                    }
                                    .focused($focusedField, equals: .inches)
                                    .frame(width: 60)
                            }
                        }
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 5.0)
                                .fill(.white)
                        )
                        
                        
                        HStack {
                            Text("Weight")
                            
                            Spacer()
                            
                            ZStack {
                                if weight != nil && weight != 0 {
                                    Text("\(weight ?? 0)").foregroundColor(.clear) + Text("lbs.")
                                }
                                
                                TextField(
                                    "lbs.",
                                    value: $weight,
                                    format: .number
                                )
                                    .keyboardType(.numberPad)
                                    .submitLabel(.done)
                                    .focused($focusedField, equals: .lbs)
                                    .frame(width: 70)
                            }
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
                            currentPage = .allergens
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
        //        .padding(.bottom)
        .padding(.horizontal)
        .padding(.horizontal)
    }
}

struct Welcome_Body_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_Body(currentPage: .constant(.body))
    }
}
