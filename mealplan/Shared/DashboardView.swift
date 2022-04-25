//
//  DashboardView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/16/22.
//

import SwiftUI

enum ViewType {
    case day_of_week, meal_time
}

struct DashboardView: View {
    
    @State var showFilterView = false
    @Binding var filterItems: Set<FilterOption>

    @State var is_day = false
    var view_type: ViewType {
        return is_day == true ? .day_of_week : .meal_time
    }
    
    var body: some View {
        ZStack {
            Color.welcomePageBackground
                .ignoresSafeArea(.all)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("This Week's Recipes")
                            .bold()
                            .font(.system(.largeTitle, design: .rounded))
                                                    
                        HStack {
                            Text("Day")
                                .font(.system(.caption, design: .rounded))
                                .bold()
                            Toggle("", isOn: $is_day)
                                .tint(Color.welcomeViewBackground)
                                .labelsHidden()
                            Text("Time")
                                .font(.system(.caption, design: .rounded))
                                .bold()
                            Spacer()
                        }
                    }
                    .foregroundColor(Color.welcomeViewBackground)
                    .padding(.horizontal)
                    
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
                
                if Recipes.recipes.filter({ filterItems.contains($0.allergen) }).count > 0 {
                    if view_type == .day_of_week {
                        List(DayOfWeek.allCases, id: \.self) { day in
                            Section("\(day)") {
                                ForEach(Recipes.recipes.filter({ $0.day_of_week == day && filterItems.contains($0.allergen) })) { recipe in
                                    RecipeListItem(recipe: recipe)
                                }
                            }
                        }
                    } else if view_type == .meal_time {
                        List(MealTime.allCases, id: \.self) { time in
                            Section("\(time)") {
                                ForEach(Recipes.recipes.filter({ $0.meal_time == time && filterItems.contains($0.allergen) })) { recipe in
                                    RecipeListItem(recipe: recipe)
                                }
                            }
                        }
                    }
                } else {
                    Spacer()
                    Text("Adjust the filters to find some recipes")
                        .foregroundColor(Color.black)
                        .font(.system(.title3, design: .rounded))
                    Spacer()
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
                    
                    FilterView(selectedItems: $filterItems)
                    
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
        .accentColor(.welcomeViewBackground)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(filterItems: .constant(Set()), is_day: true)
    }
}
