//
//  SearchKeywordViewModel.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 02/05/23.
//

import Foundation

@MainActor
class SearchKeywordViewModel : BaseViewModel{
    
    @Published var state: Array<String> = []
    var recipeService: RecipeService
    
    init(recipeService:RecipeService) {
        self.recipeService = recipeService
    }
    
    func getSearchKeywords(query:String){
        Task{
            let kResponse = try await recipeService.searchForKeyword(keyword: query)
            state = kResponse
        }
    }
}
