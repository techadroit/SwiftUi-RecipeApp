//
//  RecipeLocalRepository.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 18/01/23.
//

import Foundation

class RecipeLocalRepository: LocalRepository{
    override init(rFactory: RealmFactory) {
        super.init(rFactory: rFactory)
    }
    
    func saveRecipes(recipeData: RecipeData){
        rFactory.write(data: recipeData)
    }
    
    func removeAllCuisines(){
        rFactory.deleteAll(data: Cuisines.self)
    }
    
    func getAllRecipes()-> Array<RecipeData>{
        return rFactory.readAll(data: RecipeData.self)
    }
}
