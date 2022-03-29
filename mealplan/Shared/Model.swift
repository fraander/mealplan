//
//  Model.swift
//  mealplan
//
//  Created by Frank Anderson on 3/28/22.
//

import Foundation
import SwiftUI

enum MealTime {
    case breakfast, lunch, dinner
}

struct FilterOption: Identifiable, Hashable {
    static let options = [
        nut_free,
        gluten_free,
        vegetarian,
        vegan,
        pescatarian,
        shellfish_free,
        kosher,
        halal,
        lactose_free
    ]
    
    static let nut_free = FilterOption(title: "Nut Free")
    static let gluten_free = FilterOption(title: "Gluten Free")
    static let vegetarian = FilterOption(title: "Vegetarian")
    static let vegan = FilterOption(title: "Vegan")
    static let pescatarian = FilterOption(title: "Pescatarian")
    static let shellfish_free = FilterOption(title: "Shellfish Free")
    static let kosher = FilterOption(title: "Kosher")
    static let halal = FilterOption(title: "Halal")
    static let lactose_free = FilterOption(title: "Lactose Free")
    
    var id = UUID()
    let title: String
    var chosen = false
}

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var meal_time: MealTime
    var allergen: FilterOption
    
    var procedure: [String]
    var ingredients: [RecipeItem]
}

struct RecipeItem: Identifiable {
    enum ItemType {
        case entry, header
    }
    
    var content: String
    var type: ItemType
    var id = UUID()
    
    init(_ content: String, type: ItemType = .entry) {
        self.content = content
        self.type = type
    }
    
    func getText() -> Text {
        return type == .entry ? Text(content) : Text(content).bold()
    }
}

struct Recipes {
    static let recipes = [
        Recipe(title: "Spiced Oatmeal Fritters with Coconut Caramel Pears",
               meal_time: .breakfast,
               allergen: FilterOption.gluten_free,
               procedure: [
                "1. In a large saucepan, combine the almond milk, cloves, nutmeg and 3 tsp of the cinnamon. Bring to a simmer. Tip in the oats and cook for 6 mins over a low heat, stirring constantly, until thick and creamy, like porridge. Scrape into a mixing bowl, cover, and cool for 20 mins.",
                "2.  While you wait, make the caramel pears. Sprinkle the sugar evenly over a frying pan set on a low heat. Don't stir it, but wait until it starts to melt, turning dark golden here and there. When most of the sugar is melted, gently swirl to incorporate any dry patches. Stir in 25g of the coconut butter. Toss the pear slices in the remaining cinnamon, then add to the caramel and cook for 5 mins until softened. Set aside.",
                "3. Return to the oats now, beating in the eggs and ½ tsp salt to make a loose pancake-like batter. Heat oven to 140 C/120C fan/gas 1 and put plates in to warm.",
                "4. Melt a little of the remaining coconut butter in a frying pan. When hot, add half-ladlefuls of the batter spaced apart and cook for 4 mins each side, or until golden brown. Remove to a plate and keep warm in the oven. Continue frying the fritters, adding more coconut butter as needed. Serve the fritters topped with a spoonful of coconut yogurt followed by the warm pears."
               ],
               ingredients: [
                RecipeItem("For the fritters", type: .header),
                RecipeItem("250ml almond milk"),
                RecipeItem("1/2 tsp ground cloves"),
                RecipeItem("1 tsp ground nutmeg"),
                RecipeItem("4 tsp ground cinnamon"),
                RecipeItem("100g rolled oats"),
                RecipeItem("3 large eggs"),
                RecipeItem("For the caramel pears", type: .header),
                RecipeItem("2 tbsp golden caster sugar"),
                RecipeItem("75g coconut butter"),
                RecipeItem("2 firm Williams pears, peeled, cored and thinly sliced"),
                RecipeItem("200g coconut yogurt, to serve")
               ]
              ),
        Recipe(title: "Gluten Free French Toast",
               meal_time: .breakfast,
               allergen: FilterOption.gluten_free,
               procedure: [
                "1. In a shallow bowl, combine the eggs, milk or dairy substitute, sugar, salt, and vanilla, and whisk until thoroughly blended.",
                "2. Dip slices of gluten-free bread in the egg mixture. Allow both sides of the bread to soak up as much egg mixture as it will hold (like a sponge).",
                "3. In a large, heavy skillet, heat oil on medium-high. Fry the coated bread slices.",
                "4. When one side is golden brown, flip the slices and cook the second side until golden brown.",
                "5. When done, remove the slices to a serving plate. Serve with butter and a dusting of confectioners' sugar and enjoy."
               ],
               ingredients: [
                RecipeItem("4 large eggs, beaten"),
                RecipeItem("1/2 to 3/4 cup milk, or dairy-free substitute, such as coconut milk"),
                RecipeItem("1 teaspoon sugar, or honey"),
                RecipeItem("1 pinch salt, optional"),
                RecipeItem("8 slices gluten-free bread"),
                RecipeItem("2 tablespoons canola oil"),
                RecipeItem("Sifted confectioners' sugar, for garnish")
               ]
              )
    ]
}
