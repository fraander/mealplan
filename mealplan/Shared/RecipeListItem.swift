//
//  RecipeListItem.swift
//  mealplan
//
//  Created by Frank Anderson on 4/24/22.
//

import SwiftUI

struct RecipeListItem: View {
    
    let recipe: Recipe
    
    var body: some View {
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

struct RecipeListItem_Previews: PreviewProvider {
    static var previews: some View {
        List (0..<3) { _ in
            Section("Breakfast") {
                ForEach(Recipes.recipes) {recipe in
                    RecipeListItem(recipe: recipe)
                }
            }
        }
    }
}
