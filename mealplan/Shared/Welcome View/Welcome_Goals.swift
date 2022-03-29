//
//  Welcome_Goals.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

struct Welcome_Goals: View {
    
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
                    Image("plants-doctor")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.top, 100)
                    
                    Text("Goals")
                        .font(.system(.headline, design: .rounded))
                    
                    VStack(spacing: 8) {
                        Text("Pickers")
                    }
                    .padding(.horizontal)
                    
                    Button {
                        currentPage = .dashboard
                    } label: {
                        Text("Next Page")
                            .font(.system(.headline, design: .rounded))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.welcomePageAccent)
                    .disabled(preventNextPage)
                    
                }
            }
        }
//        .padding(.bottom)
        .padding(.horizontal)
        .padding(.horizontal)
    }
}

struct Welcome_Goals_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_Goals(currentPage: .constant(.goals))
    }
}
