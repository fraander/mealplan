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
                .fill(Color.welcomePageBackground)
            
            ScrollView {
                VStack(spacing: 16) {
                    Image("kitchen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.top, 100)
                    
                    Text("Dietary Restrictions")
                        .font(.system(.headline, design: .rounded))
                    
                    FilterView(defaultTextColor: .black, selectionBackgroundColor: Color.welcomePageAccent)
                    
                    Button {
                        withAnimation {
                            currentPage = .goals
                        }
                    } label: {
                        Text("Next Page")
                            .font(.system(.headline, design: .rounded))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.welcomePageAccent)
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
