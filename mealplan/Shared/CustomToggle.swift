//
//  CustomToggle.swift
//  mealplan
//
//  Created by Frank Anderson on 4/24/22.
//

import SwiftUI

struct CustomToggle: View {
    @Binding var toggle: ViewType
    @State private var offset = CGSize.zero
    
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.welcomePageBackground)
            Text(toggle == .meal_time ? "Time" : "Day")
                .foregroundColor(Color.black)
                .font(.system(size: 8, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: toggle == .meal_time ? .leading : .trailing)
            GeometryReader { geo in
                ZStack {
                    Capsule()
                        .fill(Color.welcomePageAccent)
                        .frame(width: geo.size.width / 2, alignment: toggle == .meal_time ? .leading : .trailing)
                        .padding(5)
                    Text(toggle == .day_of_week ? "Time" : "Day")
                        .foregroundColor(Color.white)
                        .font(.system(size: 8, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: toggle == .meal_time ? .trailing : .leading)
                }
                    .offset(x: offset.width, y: 0)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                if abs(offset.width) > geo.size.width / 2 {
                                    toggle = toggle == .meal_time ? .day_of_week : .meal_time
                                }
                                
                                offset = .zero
                            }
                    )
            }
        }
    }
}

struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggle(toggle: .constant(.meal_time))
            .frame(width: 200, height: 50)
    }
}
