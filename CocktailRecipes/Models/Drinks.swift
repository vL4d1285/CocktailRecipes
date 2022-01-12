//
//  Drinks.swift
//  CocktailRecipes
//
//  Created by Vlad Ryabtsev on 09.01.2022.
//

import Foundation

struct Drink: Decodable {
    let drinks: [Recipes]
}

struct Recipes: Decodable {
    let strDrink: String?
    let strCategory: String?
    let strAlcoholic: String?
    let strGlass: String?
    let strInstructions: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    
    let strDrinkThumb: String?
    
    var description: String {
        """
    Drink: \(strDrink ?? " - ")
    Category: \(strCategory ?? " - ")
    Alcoholic: \(strAlcoholic ?? " - ")
    Glass: \(strGlass ?? " - ")
    """
    }
    
    var ingredients: String {
        """
    Ingredient 1: \(strIngredient1 ?? " no ")
    Ingredient 2: \(strIngredient2 ?? " no ")
    Ingredient 3: \(strIngredient3 ?? " no ")
    Ingredient 4: \(strIngredient4 ?? " no ")
    Ingredient 5: \(strIngredient5 ?? " no ")
    Ingredient 6: \(strIngredient6 ?? " no ")
    Ingredient 7: \(strIngredient7 ?? " no ")
    """
    }
}

enum Link: String {
    case cocktailsApi = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
}


