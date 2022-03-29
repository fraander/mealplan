//
//  FilterView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/16/22.
//

import SwiftUI

struct FilterView: View {
    let items = FilterOption.options
    
    var defaultTextColor = Color.defaultTextColor
    var selectionTextColor = Color.selectionTextColor
    var selectionBackgroundColor = Color.selectionBackgroundColor
    
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
            Color.filterViewBackground
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
                .foregroundColor(.filterViewText)
                .padding()
                .background(Color.filterViewBackground)
                
                
                
                FilterView()
            }
        }
    }
}
