//
//  RecipeDetailViewModel.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 03/03/23.
//

import Foundation

@MainActor
class RecipeDetailViewModel : BaseViewModel{
    
    @Published var recipeDetail: RecipeDetailResponse? = nil
    var recipeService: RecipeService
    var recipeLocalRepository: RecipeLocalRepository
    
    init(recipeService:RecipeService,recipeLocalRepository:RecipeLocalRepository) {
        self.recipeService = recipeService
        self.recipeLocalRepository = recipeLocalRepository
    }
    
    func getDetailFor(id:String){
        Task{
            let recipeDetailResponse = try await recipeService.fetchDetailFor(id: id)
            recipeDetail = recipeDetailResponse
        }
    }
}
