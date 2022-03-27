//
//  DashboardView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/16/22.
//

import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var title = "My Recipe"
}

struct DashboardView: View {
    
    @State var showFilterView = false
    @State var filterItems = Set<FilterOption>()
    
    @State var recipes = [Recipe(), Recipe(), Recipe()]
    
    var body: some View {
        ZStack {
            Color(red: 0.839, green: 0.863, blue: 0.863, opacity: 1.000)
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
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
                                    .fill(Color(red: 0.275, green: 0.455, blue: 0.380, opacity: 1.000))
                            }
                            .padding(.horizontal)
                    }
                    
                } // gear icon
                
                HStack {
                    Text("Week's Recipes")
                        .bold()
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(Color(red: 0.275, green: 0.455, blue: 0.380, opacity: 1.000))
                        .padding(.horizontal)
                    Spacer()
                } // header
                
                List(recipes) { recipe in
                    Text(recipe.title)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .sheet(isPresented: $showFilterView) {
                ZStack {
                    Color(red: 0.475, green: 0.655, blue: 0.580, opacity: 1.000)
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Text("Filters")
                                .bold()
                        }
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(Color(red: 0.939, green: 0.963, blue: 0.963, opacity: 1.000))
                        .padding()
                        .background(Color(red: 0.475, green: 0.655, blue: 0.580, opacity: 1.000))
                        
                        FilterView(selectedItems: filterItems)
                        
                        Button("Done") {
                            showFilterView = false
                        }
                        .font(Font.title3.weight(.bold))
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.575, green: 0.755, blue: 0.680, opacity: 1.000))
                        
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
