//
//  RecipeView.swift
//  mealplan
//
//  Created by Frank Anderson on 3/29/22.
//

import SwiftUI

struct RecipeView: View {
    
    let recipe: Recipe
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                Text(recipe.allergen.title)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.gray)
                
                Divider()
                
                Text("Ingredients")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.semibold)
                ForEach(recipe.ingredients) { ingredient in
                    ingredient.getText()
                        .padding(.top, 4)
                }
                
                Divider()
                
                Text("Procedure")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.semibold)
                
                ForEach(recipe.procedure, id: \.self) {step in
                    Text(step)
                        .padding(.top, 4)
                }
            }
            .padding(.vertical, 80)
            .padding()
        }
        .ignoresSafeArea(edges: .all)
        .navigationBarHidden(false)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipes.recipes.first!)
    }
}
