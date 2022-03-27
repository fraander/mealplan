//
//  FilterView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/16/22.
//

import SwiftUI

struct FilterOption: Identifiable, Hashable {
    var id = UUID()
    let title: String
    var chosen = false
}

struct Ingredient{
    var id = UUID()
    var name: String
    var isSelected: Bool = false
}

struct FilterView: View {
    let items = [
        FilterOption(title: "Nut Free"),
        FilterOption(title: "Gluten Free"),
        FilterOption(title: "Vegetarian"),
        FilterOption(title: "Vegan"),
        FilterOption(title: "Pescatarian"),
        FilterOption(title: "Shellfish Free"),
        FilterOption(title: "Kosher"),
        FilterOption(title: "Halal"),
        FilterOption(title: "Lactose Free")
    ]
    
    var defaultTextColor = Color(red: 0.939, green: 0.963, blue: 0.963, opacity: 1.000)
    var selectionTextColor = Color.white
    var selectionBackgroundColor = Color(red: 0.575, green: 0.755, blue: 0.680, opacity: 1.000)
    
    @State var selectedItems = Set<FilterOption>()
    
    var body: some View{
        ScrollView(.vertical) {
            ForEach(items, id: \.id) { item in
                Button {
                    if selectedItems.contains(item) {
                        selectedItems.remove(item)
                    } else {
                        selectedItems.insert(item)
                    }
                } label: {
                    HStack {
                        Text("\(item.title)")
                            .font(.system(.headline, design: .rounded))
                        Spacer()
                        Image(systemName: selectedItems.contains(item) ? "checkmark.circle.fill" : "checkmark.circle")
                            .font(.system(.headline, design: .rounded))
                    }
                    .foregroundColor(selectedItems.contains(item) ? selectionTextColor : defaultTextColor)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(selectedItems.contains(item) ?
                                  selectionBackgroundColor : .clear
                            )
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(red: 0.475, green: 0.655, blue: 0.580, opacity: 1.000)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(Font.largeTitle.weight(.bold))
                    Text("Filters")
                        .bold()

                    Spacer()
                }
                .font(.system(.largeTitle, design: .rounded))
                .foregroundColor(Color(red: 0.939, green: 0.963, blue: 0.963, opacity: 1.000))
                .padding()
                .background(Color(red: 0.475, green: 0.655, blue: 0.580, opacity: 1.000))
                
                
                
                FilterView()
            }
        }
    }
}
