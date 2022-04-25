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
    @Binding var filters: Set<FilterOption>
    
    var body: some View {
        ZStack {
            Color.welcomeViewBackground
                .ignoresSafeArea(.all)
            
            TabView(selection: $page) {
                Welcome_Account(currentPage: $page)
                    .tag(WelcomePage.account)
                
                Welcome_PersonalDetails(currentPage: $page)
                    .tag(WelcomePage.personalDetails)
                
                Welcome_Body(currentPage: $page)
                    .tag(WelcomePage.body)
                
                Welcome_Allergens(currentPage: $page, filters: $filters)
                    .tag(WelcomePage.allergens)
               
                Welcome_Goals(currentPage: $page)
                    .tag(WelcomePage.goals)
            }
            .tabViewStyle(.page(indexDisplayMode: page != .allergens ? .always : .never))
            .padding(.bottom)
            .accentColor(Color.welcomePageAccent)
            
            // TODO: Full field validation
            // TODO: handle keyboard
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(page: .constant(.account), filters: .constant(Set()))
    }
}
