//
//  Model.swift
//  mealplan
//
//  Created by Frank Anderson on 3/28/22.
//

import Foundation
import SwiftUI

enum MealTime: CustomStringConvertible, CaseIterable {
    case breakfast, lunch, dinner
    
    var description: String {
        switch self {
            case .breakfast:
                return "Breakfast"
            case .lunch:
                return "Lunch"
            case .dinner:
                return "Dinner"
        }
    }
}

enum DayOfWeek: CustomStringConvertible, CaseIterable {
    case monday, tuesday, wednesday, thursday, friday //, saturday, sunday
    
    var description: String {
        switch self {
            case .monday:
                return "Monday"
            case .tuesday:
                return "Tuesday"
            case .wednesday:
                return "Wednesday"
            case .thursday:
                return "Thursday"
            case .friday:
                return "Friday"
//            case .saturday:
//                return "Saturday"
//            case .sunday:
//                return "Sunday"
        }
    }
}

struct FilterOption: Identifiable, Hashable {
    static let options = [
//        nut_free,
        gluten_free//,
//        vegetarian,
//        vegan,
//        pescatarian,
//        shellfish_free,
//        kosher,
//        halal,
//        lactose_free
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
    var day_of_week: DayOfWeek
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
        // Gluten Free
        Recipe(title: "Spiced Oatmeal Fritters with Coconut Caramel Pears",
               day_of_week: .monday, meal_time: .breakfast,
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
               day_of_week: .tuesday, meal_time: .breakfast,
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
              ),
        Recipe(title: "Jumbo Lemon Poppyseed Zucchini Muffins",
               day_of_week: .wednesday, meal_time: .breakfast,
               allergen: .gluten_free,
               procedure: [
                "Preheat oven to 400F.",
                "Use a cheese grater to grate the zucchini. Place the shreds into a clean kitchen cloth or paper towel and squeeze out the excess moisture.",
                "In a bowl, whisk together flour, sugar, poppy seeds, baking powder, baking soda, and salt.",
                "Separately, whisk together yogurt, coconut oil, lemon zest, and eggs.",
                "Add dry ingredients to wet until just combined—don’t overmix!",
                "Stir in the grated zucchini.",
                "Transfer to a jumbo muffin tin sprayed with cooking spray. (I use 2 scoops of a regular-sized ice cream scoop or about ½ cup)—fill the muffins almost to the top, but not all the way!)",
                "Bake 5 mins at 400F, and then lower to 350F and bake 20-22 minutes. They are done when tops are golden and a toothpick comes out clean.",
                "Cool slightly before popping them out of the tin and enjoying."
               ],
               ingredients: [
                RecipeItem("1 cup grated zucchini"),
                RecipeItem("3 cups oat flour"),
                RecipeItem("1/2 to 2/3 cup sugar or sweetener of choice, to taste"),
                RecipeItem("2 tablespoons poppy seeds"),
                RecipeItem("1 tablespoon baking powder"),
                RecipeItem("1/2 teaspoon baking soda"),
                RecipeItem("1/2 teaspoon salt"),
                RecipeItem("1 1/3 cups whole milk yogurt or low-fat yogurt"),
                RecipeItem("1/2 lemon juiced, optional"),
                RecipeItem("Zest of 2 lemons"),
                RecipeItem("2 large eggs"),
                RecipeItem("1/3 cup coconut oil, melted"),
                RecipeItem("Decorating sugar for topping, optional")
               ]
              ),
        Recipe(title: "Apple Ring Donuts",
               day_of_week: .thursday, meal_time: .breakfast,
               allergen: .gluten_free,
               procedure: [
                "1. Preheat the oven to 350F. Coat a donut pan liberally with cooking spray and set aside.",
                "2. In a large mixing bowl, mix together the flour, flax, xanthan gum (if using), baking powder, salt, and spices.",
                "3. In a medium bowl, beat together the egg, butter, sugar, and vanilla until creamy.",
                "4. On a cutting board, slice the apples into ¼-inch to ½-inch thick.",
                "5. Pour the egg mixture into the dry ingredients and mix. Add the applesauce, and mix again to form the batter.",
                "6. Using a teaspoon, spoon the batter into the bottom of the donut pan, just enough to lightly cover the bottom.",
                "7. Add an apple ring and press lightly into the batter. Top with another teaspoon of batter, lightly covering the exposed ring. Repeat, filling all the cavities.",
                "8. Bake for 20 minutes or until golden brown."
               ],
               ingredients: [
                RecipeItem("1 cup gluten-free flour"),
                RecipeItem("1/2 cup ground flax"),
                RecipeItem("1/2 teaspoon xanthan gum (optional)"),
                RecipeItem("1 1/2 teaspoons baking powder"),
                RecipeItem("1/2 teaspoon salt"),
                RecipeItem("1 1/2 teaspoons ground cinnamon"),
                RecipeItem("1/2 teaspoon nutmeg"),
                RecipeItem("1 large egg"),
                RecipeItem("1/3 cup softened butter"),
                RecipeItem("1/2 cup granulated sugar"),
                RecipeItem("1 teaspoon vanilla"),
                RecipeItem("2 large apples, cored and peeled"),
                RecipeItem("1/2 cup unsweetened applesauce")
               ]
              ),
        Recipe(title: "Low-Carb Breakfast Wraps",
               day_of_week: .friday, meal_time: .breakfast,
               allergen: .gluten_free,
               procedure: [
                "1. In a large bowl, whisk together eggs and milk. Season with salt and pepper.",
                "2. In a medium skillet over medium heat, melt butter. Pour 1/3 of the egg mixture into the skillet, moving to create a thin layer that covers the entire pan. Cook for 2 minutes.",
                "3. Add 1/2 cup cheddar and cover for 2 minutes more, until the cheese is melty. Add sausage, avocado and tomatoes to the center of egg wrap.",
                "4. Using a spatula, fold both ends over filling and \"glue\" shut with melted cheese.",
                "5. Remove from pan. Garnish with chives and serve."
               ],
               ingredients: [
                RecipeItem("4 large eggs"),
                RecipeItem("1/4 cup milk"),
                RecipeItem("1 tbsp. butter"),
                RecipeItem("6 breakfast sausages, cooked according to package instructions"),
                RecipeItem("1 1/2 cup shredded cheddar, divided"),
                RecipeItem("1 avocado, cut into thin slices"),
                RecipeItem("1/2 cup grape tomatoes, quartered"),
                RecipeItem("kosher salt"),
                RecipeItem("Freshly ground black pepper"),
                RecipeItem("1 tbsp. Chopped chives")
               ]
              ),
        
        Recipe(title: "Spicy chicken & avocado wraps",
               day_of_week: .monday, meal_time: .lunch,
               allergen: .gluten_free,
               procedure: [
                "1. Mix the chicken with the lime juice, chilli powder and garlic.",
                "2. Heat the oil in a non-stick frying pan then fry the chicken for a couple of mins – it will cook very quickly so keep an eye on it. Meanwhile, warm the wraps following the pack instructions or, if you have a gas hob, heat them over the flame to slightly char them. Do not let them dry out or they are difficult to roll.",
                "3. Squash half an avocado onto each wrap, add the peppers to the pan to warm them through then pile onto the wraps with the chicken, and sprinkle over the coriander. Roll up, cut in half and eat with your fingers."
               ],
               ingredients: [
                RecipeItem("1 chicken breast (approx 180g), thinly sliced at an angle"),
                RecipeItem("generous squeeze juice 1/2 lime"),
                RecipeItem("1/2 tsp mild chilli powder"),
                RecipeItem("1 garlic clove, chopped"),
                RecipeItem("1 tsp olive oil"),
                RecipeItem("2 seeded wraps"),
                RecipeItem("1 avocado, halved and stoned"),
                RecipeItem("1 roasted red pepper from a jar, sliced")
               ]
              ),
        Recipe(title: "Mediterranean Tuna Salad",
               day_of_week: .tuesday, meal_time: .lunch,
               allergen: .gluten_free,
               procedure: [
                "All you have to do for this recipe: flake the tuna, chop the veggies, and mix it together!"
               ],
               ingredients: [
                RecipeItem("Canned tuna, either water-packed or oil packed (we prefer water packed"),
                RecipeItem("Shallot"),
                RecipeItem("Red bell pepper"),
                RecipeItem("English cucumber"),
                RecipeItem("Capers"),
                RecipeItem("White wine vinegar"),
                RecipeItem("Olive oil"),
                RecipeItem("Dijon mustard"),
                RecipeItem("Kosher salt"),
                RecipeItem("Feta cheese crumbles, optional")
               ]
              ),
        Recipe(title: "Cottage Cheese Breakfast Bowls",
               day_of_week: .wednesday, meal_time: .lunch,
               allergen: .gluten_free,
               procedure: [
                "Add ¾ cup cottage cheese to a bowl. Top with berries or diced apple.",
                "Add a sprinkle of chopped nuts, a pinch of cinnamon, and a drizzle of honey."
               ],
               ingredients: [
                RecipeItem("Cottage cheese"),
                RecipeItem("Berries or diced apples pistachios or pecans"),
                RecipeItem("Cinnamon and honey")
               ]
              ),
        Recipe(title: "Simplest Salmon Bowl",
               day_of_week: .thursday, meal_time: .lunch,
               allergen: .gluten_free,
               procedure: [
                "Make the rice: Start the rice (go to How to Make Rice or Instant Pot Rice).",
                "Mix the sauce: Make the Tahini Sauce or Miso Sauce (or make in advance and refrigerate).",
                "Broil the salmon**: Preheat the broiler to high. Place a large sheet of aluminum foil on a baking sheet and brush it with olive oil. Pat each piece of salmon dry and place it on the foil skin side down. Brush salmon with a bit of olive oil and sprinkle with ½ teaspoon kosher salt (evenly divided among the fillets) and fresh ground pepper. Broil 4 to 5 minutes for very thin salmon or 7 to 10 minutes for 1-inch thick salmon, until it’s just tender and pink at the center (the internal temperature should be between 125 to 130 degrees Fahrenheit in the center).",
                "Meanwhile, make the broccoli: Chop the broccoli into medium sized florets. In small bowl, mix together ¼ cup water with the garlic powder, onion powder and mustard powder. Add 3 tablespoons olive oil to a large skillet and heat it on medium high heat. Add broccoli and ½ teaspoon kosher salt. Cook 2 to 3 minutes until starting to brown, stirring occasionally. Reduce heat to medium, and add the water and spices. Cook an additional 4 to 5 minutes until fork tender, stirring occasionally. Taste and add additional salt and black pepper as necessary. Serve immediately."
               ],
               ingredients: [
                RecipeItem("1 cup dry rice of any type (or couscous for a quicker meal)"),
                RecipeItem("1 recipe Tahini Dressing or Miso Dressing"),
                RecipeItem("1 pound wild caught salmon fillets, skin on"),
                RecipeItem("Olive oil"),
                RecipeItem("Kosher salt and fresh ground pepper"),
                RecipeItem("1 1/2 pounds fresh broccoli, stem on (about 3 large heads or 6 heaping cups florets)"),
                RecipeItem("1 teaspoon garlic powder"),
                RecipeItem("1/2 teaspoon onion powder"),
                RecipeItem("1/4 teaspoon dry mustard powder (optional)")
               ]
              ),
        Recipe(title: "Vegitarian Tortilla Soup",
               day_of_week: .friday, meal_time: .lunch,
               allergen: .gluten_free,
               procedure: [
                "Heat oven to 375°F.",
                "Make the tortilla strips: Brush the tortillas lightly with olive oil on each side. Using a pizza cutter, slice them in half, then into thin strips. Place the strips on a baking sheet and sprinkle with kosher salt. Bake for 10 to 12 minutes until crispy and lightly browned.",
                "Prep the veggies: Peel and dice the onion. Dice the green pepper. Peel and mince the garlic. Drain and rinse the beans.",
                "Make the soup: In a large pot or Dutch oven, heat 2 tablespoons olive oil and sauté the onion until translucent, about 5 minutes. Add the green pepper and the garlic and sauté for 2 minutes. Stir in the oregano and the cumin for 1 minute. Add the tomatoes, beans, corn, adobo sauce, broth, and kosher salt. Bring to a boil, then simmer for 10 minutes. Taste and add additional adobo sauce or kosher salt if desired.",
                "Prep the garnishes: Slice the radishes. Slice the lime into wedges.",
                "Serve: To serve, ladle the soup into bowls and allow to cool to warm. Garnish with the tortilla strips, radishes, torn cilantro leaves, hot sauce, and plenty of lime juice."
               ],
               ingredients: [
                RecipeItem("For the tortilla strips", type: .header),
                RecipeItem("6 6-inch corn tortillas"),
                RecipeItem("Olive oil"),
                RecipeItem("Kosher salt"),
                RecipeItem("For the vegetarian tortilla soup", type: .header),
                RecipeItem("1 yellow onion"),
                RecipeItem("1 green bell pepper"),
                RecipeItem("4 medium garlic cloves"),
                RecipeItem("2 15-ounce cans black beans"),
                RecipeItem("2 tablespoons extra-virgin olive oil, plus more for brushing"),
                RecipeItem("2 teaspoons dried oregano"),
                RecipeItem("1 teaspoon cumin"),
                RecipeItem("1 28-ounce can crushed tomatoes (fire roasted, if possible)"),
                RecipeItem("1 1/2 cups frozen corn or 15-ounce can corn"),
                RecipeItem("1 tablespoon adobo sauce (from 1 can chipotle peppers in adobo sauce)"),
                RecipeItem("1 quart (4 cups) vegetable broth"),
                RecipeItem("1 teaspoon kosher salt, plus more for sprinkling"),
                RecipeItem("4 radishes, for garnish"),
                RecipeItem("1 lime, for garnish"),
                RecipeItem("1 handful cilantro, for garnish")
               ]
              ),
        
        Recipe(title: "Zucchini Lasagna",
               day_of_week: .monday, meal_time: .dinner,
               allergen: .gluten_free,
               procedure: [
                "First, preheat the oven to 375°F. Then, season the pork chops well with salt and pepper. The amount of salt and pepper depends on your taste. Prepare the butter sauce by melting four tablespoons of butter in the microwave or stove. Once it’s melted, add the chopped thyme and garlic. Stir well, and set aside. In a cast iron skillet, heat the olive oil over medium heat, and when the skillet is really hot, add the pork chops, and sear them until they have a nice golden brown look, about 4 minutes per side.",
                "Pour the garlic butter mixture over the pork chops, and place the skillet in the oven. Cook until the pork chops reach an internal temperature of 145ºF.",
                "Remove the skillet from the oven, and using a spoon, pour some of the delicious butter sauce left in the skillet onto the pork chops before serving."
               ],
               ingredients: [
                RecipeItem("2 lbs zucchini"),
                RecipeItem("Ground beef"),
                RecipeItem("1 cup pasta sauce"),
                RecipeItem("Ricotta"),
                RecipeItem("Parmesan"),
                RecipeItem("Mozzarella"),
                RecipeItem("1 egg"),
                RecipeItem("Basil and parsley")
               ]
              ),
        Recipe(title: "Garlic Butter Baked Pork Chops",
               day_of_week: .tuesday, meal_time: .dinner,
               allergen: .gluten_free,
               procedure: [
                "First, preheat the oven to 375°F.",
                "Then, season the pork chops well with salt and pepper. The amount of salt and pepper depends on your taste.",
                "Prepare the butter sauce by melting four tablespoons of butter in the microwave or stove. Once it’s melted, add the chopped thyme and garlic. Stir well, and set aside."
               ],
               ingredients: [
                RecipeItem("Good quality butter — if possible organic or grass-fed or ghee"),
                RecipeItem("Garlic — fresh is always best!"),
                RecipeItem("Fresh thyme — again, I highly suggest fresh thyme"),
                RecipeItem("Salt and ground black pepper"),
                RecipeItem("Pork chops — I recommend purchasing pork that has no antibiotics or added hormones.")
               ]
              ),
        Recipe(title: "Cheesy Chicken Enchilada Casserole",
               day_of_week: .wednesday, meal_time: .dinner,
               allergen: .gluten_free,
               procedure: [
                "1. Heat oven to 375°F. Grease 13x9-inch (3-quart) baking dish. In medium bowl, mix chicken, tomatoes, beans, jalapeño chile, spices and 1 cup of the soup.",
                "2. Pour remaining soup in baking dish. Top with half of the tortillas, half of the chicken mixture and one-third of the cheese. Repeat layers. Bake about 20 minutes or until cheese is melted.",
                "3. Top casserole with chips and remaining third of cheese. Return to oven to melt cheese, about 5 minutes longer. Let stand about 10 minutes before cutting."
               ],
               ingredients: [
                RecipeItem("2 cups chopped cooked gluten-free chicken breast"),
                RecipeItem("1 can (14.5 oz) stewed diced tomatoes with jalapeños, drained"),
                RecipeItem("1 can (15 oz) black beans, drained, rinsed"),
                RecipeItem("1 tablespoon chopped seeded jalapeño chile"),
                RecipeItem("1 teaspoon chile powder"),
                RecipeItem("1/2 teaspoon dried oregano leaves"),
                RecipeItem("1 can (18.5 oz) Progresso™ Traditional chicken cheese enchilada flavor soup"),
                RecipeItem("8 gluten-free corn tortillas (6 inch), cut into fourths"),
                RecipeItem("2 cups gluten-free shredded Mexican cheese blend (8 oz)"),
                RecipeItem("2 cups gluten-free corn tortilla chips, coarsely crushed")
               ]
              ),
        Recipe(title: "Chili Beef Pasta",
               day_of_week: .thursday, meal_time: .dinner,
               allergen: .gluten_free,
               procedure: [
                "In a Dutch oven, cook beef over medium heat 6-8 minutes or until no longer pink, breaking into crumbles; drain. Stir in seasonings.",
                "Add tomato juice, water, tomato paste and sugar to pan; bring to a boil. Stir in pasta. Reduce heat; simmer, covered, 20-22 minutes or until pasta is tender, stirring occasionally. If desired, top with tomatoes and oregano."
               ],
               ingredients: [
                RecipeItem("1 pound lean ground beef (90% lean)"),
                RecipeItem("2 tablespoons dried minced onion"),
                RecipeItem("2 teaspoons dried oregano"),
                RecipeItem("2 teaspoons chili powder"),
                RecipeItem("1/2 teaspoon garlic powder"),
                RecipeItem("1/8 teaspoon salt"),
                RecipeItem("3 cups tomato juice"),
                RecipeItem("2 cups water"),
                RecipeItem("1 can (6 ounces) tomato paste"),
                RecipeItem("1 teaspoon sugar"),
                RecipeItem("8 ounces uncooked gluten-free spiral pasta"),
                RecipeItem("Chopped tomatoes and minced fresh oregano, optional")
               ]
              ),
        Recipe(title: "Pizza Prep",
               day_of_week: .friday, meal_time: .dinner,
               allergen: .gluten_free,
               procedure: [
                "1. Heat oven to 425°F. Grease 12-inch pizza pan. Stir Bisquick mix, Italian seasoning, water, oil and eggs until well combined; spread in pan.",
                "2. Bake 15 minutes (crust will appear cracked).",
                "3. Spread pizza sauce over crust; top with meat and cheese.",
                "4. Bake 10 to15 minutes longer or until cheese is melted."
               ],
               ingredients: [
                RecipeItem("1 1/3 cups Bisquick™ Gluten Free mix"),
                RecipeItem("1/2 teaspoon Italian seasoning or dried basil"),
                RecipeItem("1/2 cup water"),
                RecipeItem("1/3 cup oil"),
                RecipeItem("2 eggs, beaten"),
                RecipeItem("Suggested Topping Quantities, type: .header"),
                RecipeItem("1 can (8 oz) pizza sauce"),
                RecipeItem("1 cup bite-size pieces favorite meat or vegetables"),
                RecipeItem("1 1/2 cups shredded mozzarella cheese (6 oz)")
               ]
              ),
        
        
        //
    ]
}
