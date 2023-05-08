//
//  ServiceFactory.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 08/12/22.
//

import Foundation

class ServiceFactory{
    
    let dataSourceFactory = DataSourceFactory()
    
    func getCuisineService() -> CuisineService{
        return CuisineService(cuisineRepository: dataSourceFactory.getCuisineRepository())
    }
    
    func getRecipeService() -> RecipeService{
        return RecipeService(cuisineLocalRepository: dataSourceFactory.getCuisineRepository(),
                             recipeRemoteRepository: dataSourceFactory.getRecipeRemoteRepository(),
                             recipeLocalRepository: dataSourceFactory.getLocalRepository())
    }
}
