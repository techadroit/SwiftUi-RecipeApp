//
//  ContentViewModel.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 27/12/22.
//

import Foundation

class ContentViewModel : BaseViewModel {
    private var cuisineService : CuisineService
    private var navigationCordintar: MainNavigationCoordinator
    
    init(cuisineService: CuisineService,navigationCordinator:MainNavigationCoordinator) {
        self.cuisineService = cuisineService
        self.navigationCordintar = navigationCordinator
    }
    
    func initNavigation(){
        if cuisineService.isCuisineSelected(){
            navigationCordintar.moveToHome()
        }else {
            navigationCordintar.moveToUserInterestView()
        }
    }
}
