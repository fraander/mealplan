//
//  DashboardView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/16/22.
//

import SwiftUI

struct DashboardView: View {
    
    @State var showFilterView = false
    @State var filterItems = Set<FilterOption>()
        
    var body: some View {
        ZStack {
            Color.welcomePageBackground                .ignoresSafeArea(.all)
            
            VStack {
                HStack(alignment: .top) {
                    Text("This Week's Recipes")
                        .bold()
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(Color.welcomeViewBackground)
                        .padding(.horizontal)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    Button {
                        showFilterView.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(Font.title.weight(.heavy))
                            .foregroundColor(.white)
                            .padding(10)
                            .background {
                                Circle()
                                    .fill(Color.filterViewBackground)
                            }
                            .padding(.horizontal)
                    } // gear button
                    
                } // header
                
                List(Recipes.recipes) { recipe in
                    NavigationLink {
                        RecipeView(recipe: recipe)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(recipe.title)
                                .font(.system(.body, design: .rounded))
                            Text(recipe.allergen.title)
                                .font(.system(.caption, design: .rounded))
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .sheet(isPresented: $showFilterView) {
                ZStack {
                    Color.filterViewBackground
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Text("Filters")
                                .bold()
                        }
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(Color.defaultTextColor)
                        .padding()
                        .background(Color.filterViewBackground)
                        
                        FilterView(selectedItems: filterItems)
                        
                        Button("Done") {
                            showFilterView = false
                        }
                        .font(Font.title3.weight(.bold))
                        .buttonStyle(.borderedProminent)
                        .tint(Color.selectionBackgroundColor)
                        
                        Spacer()
                    }
                }
            }

        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
