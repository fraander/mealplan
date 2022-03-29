//
//  WelcomeView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

enum WelcomePage {
    case account, personalDetails, body, allergens, goals, dashboard
}

struct WelcomeView: View {
    
    @Binding var page: WelcomePage
    
    var body: some View {
        ZStack {
            Color(red: 0.275, green: 0.455, blue: 0.380, opacity: 1.000)
                .ignoresSafeArea(.all)
            
            TabView(selection: $page) {
                Welcome_Account(currentPage: $page)
                    .tag(WelcomePage.account)
                
                Welcome_PersonalDetails(currentPage: $page)
                    .tag(WelcomePage.personalDetails)
                
                Welcome_Body(currentPage: $page)
                    .tag(WelcomePage.body)
                
                Welcome_Allergens(currentPage: $page)
                    .tag(WelcomePage.allergens)
               
                Welcome_Goals(currentPage: $page)
                    .tag(WelcomePage.goals)
            }
            .tabViewStyle(.page(indexDisplayMode: page != .allergens ? .always : .never))
            .padding(.bottom)
            
            // TODO: Full field validation
            // TODO: Tint color on pickers (date, menu)
            // TODO: handle keyboard
            // TODO: Refactor
            // TODO: Goals to pick from
            // TODO: Success page (confetti?)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(page: .constant(.account))
    }
}
