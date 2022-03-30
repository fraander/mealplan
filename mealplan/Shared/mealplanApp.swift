//
//  mealplanApp.swift
//  Shared
//
//  Created by Frank Anderson on 3/14/22.
//

import SwiftUI

// https://docs.google.com/spreadsheets/d/1-_Az-wQxywRqP1Xs7ERafEhxr6sktdLKHAHOl5rb1-s/edit#gid=0

@main
struct mealplanApp: App {
    
    @State private var page: WelcomePage = .account
    @State private var filters = Set<FilterOption>()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if page != .dashboard {
                        WelcomeView(page: $page, filters: $filters)
                    } else {
                        DashboardView(filterItems: $filters)
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}
