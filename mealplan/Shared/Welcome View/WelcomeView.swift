//
//  WelcomeView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

enum WelcomePage {
    case account, personalDetails, body, allergens, goals, success
}

struct WelcomeView: View {
    
    @State private var page: WelcomePage = .account
    
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
                Welcome_Allergens()
                    .tag(WelcomePage.allergens)
                Welcome_Goals()
                    .tag(WelcomePage.goals)
                Welcome_Success()
                    .tag(WelcomePage.success)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .padding(.bottom)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
