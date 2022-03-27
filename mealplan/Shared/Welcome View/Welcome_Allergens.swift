//
//  Welcome_Allergens.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

struct Welcome_Allergens: View {
    
    enum Field {
        case name, email
    }
    
    @Binding var currentPage: WelcomePage
    
    @FocusState private var focusedField: Field?
    
    var preventNextPage: Bool {
        return false
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color(red: 0.839, green: 0.863, blue: 0.863, opacity: 1.000))
            
            ScrollView {
                VStack(spacing: 16) {
                    Image("kitchen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.top, 100)
                    
                    Text("Dietary Restrictions")
                        .font(.system(.headline, design: .rounded))
                    
                    FilterView(defaultTextColor: .primary, selectionBackgroundColor: Color(red: 0.639, green: 0.702, blue: 0.400, opacity: 1.000))
                    
                    Button {
                        withAnimation {
                            currentPage = .goals
                        }
                    } label: {
                        Text("Next Page")
                            .font(.system(.headline, design: .rounded))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.639, green: 0.702, blue: 0.400, opacity: 1.000))
                    .disabled(preventNextPage)
                    
                    Spacer()
                    
                }
            }
        }
//        .padding(.bottom)
        .padding(.horizontal)
        .padding(.horizontal)
    }
}

struct Welcome_Allergens_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_Allergens(currentPage: .constant(.allergens))
    }
}
