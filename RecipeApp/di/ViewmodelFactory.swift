//
//  ViewmodelFactory.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 08/12/22.
//

import Foundation

class ViewmodelFactory : BaseViewModelFactory{
    
    let serviceFactory = ServiceFactory()
    let dataSourceFactory = DataSourceFactory()
    
    func getUserInterestViewModel(navigationCordinator: MainNavigationCoordinator) -> UserInterestViewModel{
        return UserInterestViewModel(cuisineService: serviceFactory.getCuisineService(),
                                     recipeService: dataSourceFactory.getRecipeRemoteRepository(),
                                    navigationCordinator: navigationCordinator)
    }
    
    func getContentViewModel(navigationCordinator: MainNavigationCoordinator) -> ContentViewModel{
        return ContentViewModel(cuisineService: serviceFactory.getCuisineService(),
                                navigationCordinator: navigationCordinator)
    }
    
    @MainActor
    func getRecipeWithCuisinesViewModel(navigationCordinator: MainNavigationCoordinator) -> RecipeWithCuisinesViewModel{
        return RecipeWithCuisinesViewModel(recipeService: serviceFactory.getRecipeService(),navigationCoordinator: navigationCordinator)
    }
    
    func getVideoReciewViewModel() -> VideoRecipeViewModel{
        return VideoRecipeViewModel(recipeService: serviceFactory.getRecipeService())
    }
    
    @MainActor
    func getRecipeListViewModel() -> RecipeViewModel{
        return RecipeViewModel(recipeService: serviceFactory.getRecipeService(),
                               recipeLocalRepository: dataSourceFactory.getLocalRepository())
    }
    
    @MainActor
    func getFavListViewModel() -> FavouriteListViewModel{
        return FavouriteListViewModel(recipeService: serviceFactory.getRecipeService(),
                               recipeLocalRepository: dataSourceFactory.getLocalRepository())
    }
    
    @MainActor
    func getRecipeDetailViewModel() -> RecipeDetailViewModel{
        return RecipeDetailViewModel(recipeService: serviceFactory.getRecipeService(),
                               recipeLocalRepository: dataSourceFactory.getLocalRepository())
    }
    
    @MainActor
    func getSearchViewModel() -> SearchKeywordViewModel{
        return SearchKeywordViewModel(recipeService: serviceFactory.getRecipeService())
    }
}
