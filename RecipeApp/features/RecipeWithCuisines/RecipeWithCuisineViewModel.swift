//
//  RecipeWithCuisineViewModel.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 13/07/22.
//

import Foundation
import UIKit
import SwiftUI

@MainActor
class RecipeWithCuisinesViewModel : BaseViewModel{
    
    private var recipeService: RecipeService
    var navigationCoordinator: MainNavigationCoordinator
    @Published var recipeList = [String:Array<RecipeItem>]()
    
    init(recipeService: RecipeService,navigationCoordinator: MainNavigationCoordinator) {
        self.recipeService = recipeService
        self.navigationCoordinator = navigationCoordinator
    }
    
    func loadcuisine(){
        Task {
            do {
                let data = await recipeService.loadRecipesForAllCuisines()
                    self.recipeList = data
                print(data)
            } catch {
                
            }
        }
    }
    
    func moveToRecipeDetail(id:String){
        navigationCoordinator.moveToRecipeDetail(id: id)
    }
}
