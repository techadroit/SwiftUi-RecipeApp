//
//  RecipeViewModel.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 18/01/23.
//

import Foundation

@MainActor
class FavouriteListViewModel : BaseViewModel{
    
    @Published var recipeList = Array<RecipeItem>()

    var recipeService: RecipeService
    var recipeLocalRepository: RecipeLocalRepository
    
    init(recipeService:RecipeService, recipeLocalRepository: RecipeLocalRepository) {
        self.recipeLocalRepository = recipeLocalRepository
        self.recipeService = recipeService
    }
    
    func loadRecipes(){
        Task.init{
            do{
                let result = try await recipeService.getAllFavouriteRecipes()
                self.recipeList = result
            } catch{
                
            }
        }
    }
    
    func saveRecipe(recipeItem: RecipeItem) {
        recipeItem.isSaved = true
        // update the recipeList with the modified recipe item
        updateRecipe(recipeItem: recipeItem)
    }

    func unsaveRecipe(recipeItem: RecipeItem) {
        recipeItem.isSaved = false
        // update the recipeList with the modified recipe item
        updateRecipe(recipeItem: recipeItem)
    }

    private func updateRecipe(recipeItem: RecipeItem) {
        for (index, item) in recipeList.enumerated() where item.id == recipeItem.id {
            recipeList[index] = recipeItem
            saveRecipeToLocal(recipeItem: recipeItem)
        }
    }

    private func saveRecipeToLocal(recipeItem:RecipeItem){
        recipeLocalRepository.saveRecipes(recipeData: recipeItem.toRecipeData())
    }
}
