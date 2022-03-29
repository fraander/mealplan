//
//  RecipeView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/29/22.
//

import SwiftUI

struct RecipeView: View {
    
    let recipe: Recipe
    
    var ingredients: AttributedString {
        do {
            return try AttributedString(markdown: recipe.ingredients)
        } catch {
            return "failed"
        }
    }
    
    var procedure: AttributedString {
        do {
            return try AttributedString(markdown: recipe.procedure)
        } catch {
            return "failed"
        }
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                Text(recipe.allergen.title)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text("Ingredients")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.semibold)
                ScrollView {
                    Text(ingredients)
                }
                
                Divider()
                
                Text("Procedure")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.semibold)
                ScrollView {
                    Text(procedure)
                }
            }
        }
        .padding()
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipes.recipes.first!)
    }
}
