//
//  Colors.swift
//  mealplan
//
//  Created by Frank Anderson on 3/29/22.
//

import SwiftUI

extension Color {
    static let colors = [
        defaultTextColor,
        selectionTextColor,
        selectionBackgroundColor,
        filterViewBackground,
        filterViewText,
        welcomeViewBackground,
        welcomePageBackground,
        welcomePageAccent
    ]
    
    static let defaultTextColor = Color(red: 0.939, green: 0.963, blue: 0.963, opacity: 1.000)
    static let selectionTextColor = Color.white
    static let selectionBackgroundColor = Color(red: 0.575, green: 0.755, blue: 0.680, opacity: 1.000)
    
    static let filterViewBackground = Color(red: 0.475, green: 0.655, blue: 0.580, opacity: 1.000)
    static let filterViewText = Color(red: 0.939, green: 0.963, blue: 0.963, opacity: 1.000)
    
    static let welcomeViewBackground = Color(red: 0.275, green: 0.455, blue: 0.380, opacity: 1.000)
    static let welcomePageBackground = Color(red: 0.839, green: 0.863, blue: 0.863, opacity: 1.000)
    static let welcomePageAccent = Color(red: 0.639, green: 0.702, blue: 0.400, opacity: 1.000)
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 4)) {
            ForEach(Color.colors, id: \.self) { c in
                VStack {
                    Rectangle()
                        .fill(c)
                        .frame(width: 60, height: 60)
                        .border(.black)
                    Text(c.description)
                        .font(.caption)
                }
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
